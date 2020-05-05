class DailySerializer
  include FastJsonapi::ObjectSerializer
  
  belongs_to :horoscope

  attributes :date, :text 
end
