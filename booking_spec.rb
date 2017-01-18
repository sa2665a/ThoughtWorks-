require_relative '../lib/prices'
require_relative '../lib/hotels'
require_relative '../lib/booking'
require 'Date'

describe Hotel do
	subject do
    hotels = [
      Hotel.new('Lakewood', 3),
      Hotel.new('Bridgewood', 4),
      Hotel.new('Ridgewood', 5)
    ]
    hotels[0].regular_rate = Rates.new(110, 90)
    hotels[0].reward_rate = Rates.new(80, 80)
    hotels[1].regular_rate = Rates.new(160, 60)
    hotels[1].reward_rate = Rates.new(110, 50)
    hotels[2].regular_rate = Rates.new(220, 150)
    hotels[2].reward_rate = Rates.new(100, 40)
    HotelsMiami.new(' Hotels in Miami', hotels)
  end
  		
  it "should be 90 dollars for regular customer for a Saturday in Lakewood" do
    date = ['14Mar2009(sat)']
    hotel = 'Lakewood'
    expect(subject.hotels[0].regular_rate.wknd_price).to eq(90)  
  end

  it "should be 80 dollars for a reward customer in a weekday in Lakewood" do
  	dates = ['14Mar2009(mon)']
  	hotel = 'Lakewood'
  	expect(subject.hotels[0].reward_rate.wkday_price).to eq(80)
  end

  it "should be 220 dollars for Tuesday and Wednesday for a reward customer in Bridgewood" do
  	dates = ['15Mar2009(tues)', '16Mar2009(wed)']
  	hotel = 'Bridgewood'
    expect(subject.hotels[1].reward_rate.wkday_price*2).to eq(220)
  end


end
