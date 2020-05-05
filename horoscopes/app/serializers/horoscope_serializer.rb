class HoroscopeSerializer < ActiveModel::Serializer
  has_many :dailies
  attributes :id, :name, :start_date, :end_date, :symbol, :house, :planet, :element, :quality, :polarity
end
