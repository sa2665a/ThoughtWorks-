
# here it shows the hotels information
class HotelsMiami
  attr_accessor :name, :hotels

  def initialize(name, hotels)
    @name = name
    @hotels = hotels
  end

# in here it is stated to find the cheapest hotel based on the rate it is, if its regular or reward
  def cheap_hotel(is_regular_rate, dates)
    map = {}
    hotels.each do |hotel|
      total_price = 0
      dates.each do |date|
        total_price += hotel.price(is_regular_rate, date)
      end
      map[hotel] = total_price
    end
    map = map.sort_by { |k, v| [v, -k.rating] }
    map.first[0]
  end
end