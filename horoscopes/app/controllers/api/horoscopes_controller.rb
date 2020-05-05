require 'nokogiri'
require 'open-uri'


class Api::HoroscopesController < ApplicationController

    @@arr = []

    def index
        daily_page
        horoscopes = Horoscope.all 

        options = {
            include: [:dailies] 
        }
        render json: HoroscopeSerializer.new(horoscopes, options)
    end 
    
    def create
        horoscope = Horoscope.new(name, start_date, end_date, symbol, house, planet, element, quality, polarity)
    end

    def show
        horoscope = Horoscope.find(params[:id])
        render json: HoroscopeSerializer.new(horoscope)
    end 

    def daily_page
        site = open("https://astrostyle.com/horoscopes/daily/")
        doc = Nokogiri::HTML(site)

        doc.css('.my-horoscope-table-wrap').css('a').each do |i|
            @@arr << i.attr('href')
        end 
        daily_readings
    end 

    def daily_readings
        @@arr.uniq!.each do |d|
            site = open(d)
            doc = Nokogiri::HTML(site)
            reading = doc.css('.horoscope-content').css('p').text
            date = doc.css('.horoscope-content').css('h2').children[0].text.strip
            sign = d.split("/").last.capitalize
            find_horoscope = Horoscope.find_by(name: sign) 
            
            find_horoscope.dailies << Daily.create(horoscope_id: find_horoscope.id, date: date, text: reading)
            
          
        end 
    end 


end
