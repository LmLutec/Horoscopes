class HoroscopeSerializer
  include FastJsonapi::ObjectSerializer

  #has_many :dailies

  attributes :name, :start_date, :end_date, :symbol, :house, :planet, :element, :quality, :polarity
end
