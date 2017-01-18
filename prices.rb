#in here it states if its in a weekday of in a weekend and the rates depend on that information

class Rates 
  attr_accessor :wknd_price, :wkday_price

  def initialize(wkday_price, wknd_price)
    @wknd_price = wknd_price
    @wkday_price = wkday_price
  end

#if its a weekend day (saturday or sunday, or both) it shows its respective price
  def price(date)
    if date.saturday? || date.sunday?
      return wknd_price
    else return wkday_price
    end
  end
    
end
