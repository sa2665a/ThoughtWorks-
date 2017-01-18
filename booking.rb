require 'date'

#getting the hotels information and showing the correct rate based on the client and the date 
class Hotel
  attr_accessor :name, :rating, :regular_rate, :reward_rate

  def initialize(name, rating)
    @name = name
    @rating = rating
    @rates = {}
  end

#if its regular rate it shows its rate, if its rewards it shows the rewards rate
  def price(is_regular_rate, sdate)
    if is_regular_rate
      rate = regular_rate
    else
      rate = reward_rate
    end

    #format of the date, grab the dates and abbreviations
    sdate = sdate.gsub('thur', 'thu')
    date_format = Date.strptime(sdate, '%d%b%Y(%a)')
    rate.price(date_format)
  end
end




