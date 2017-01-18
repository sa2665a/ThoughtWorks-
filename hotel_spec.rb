require_relative '../lib/prices'
require_relative '../lib/hotels'
require_relative '../lib/booking'

#in here I put the information of the hotels to test them
describe HotelsMiami do
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

#the following tests are basic tests to know if the information is correct
  it 'should exist three hotels in Miami' do
    expect(subject.hotels.length).to eq(3)
  end

  it 'should exist a hotel called Lakewood' do
    expect(subject.hotels[0].name).to eq('Lakewood')
  end

   it 'should exist a hotel called Bridgewood' do
    expect(subject.hotels[1].name).to eq('Bridgewood')
  end

   it 'should exist a hotel called Ridgewood' do
    expect(subject.hotels[2].name).to eq('Ridgewood')
  end

  it 'should exist hotels with  differents ratings' do
    lakewood = subject.hotels[0]
    expect(lakewood.rating).to eq(3)
    bridgewood = subject.hotels[1]
    expect(bridgewood.rating).to eq(4)
    ridgewood = subject.hotels[2]
    expect(ridgewood.rating).to eq(5)
  end


#in the following tests I input the data and show the respective tests 
  it 'should return the cheapest hotel for regular client' do
    dates = ['16Mar2009(mon)', '17Mar2009(tue)', '18Mar2009(wed)']
    hotel = subject.cheap_hotel(true, dates)
    expect(hotel.name).to eq('Lakewood')
    dates = ['20Mar2009(fri)', '21Mar2009(sat)', '22Mar2009(sun)']
    hotel = subject.cheap_hotel(true, dates)
    expect(hotel.name).to eq('Bridgewood')
  end

  it 'should return the cheapest hotel for rewards client' do
    dates = ['26Mar2009(thur)', '27Mar2009(fri)', '28Mar2009(sat)']
    hotel = subject.cheap_hotel(false, dates)
    expect(hotel.name).to eq('Ridgewood')
  end

  # it 'should return the cheapest hotel with highest rating if there is a tie' do
  #   dates = ['26Mar2009(thur)', '27Mar2009(fri)', '28Mar2009(sat)']
  #   hotel = subject.cheap_hotel(false, dates)
  #   expect(hotel.name).to eq('Ridgewood')
  # end


end
