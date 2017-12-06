class DailySurfing::Surf_Data
  attr_accessor :name, :date, :condition, :wave_height, :wind, :weather

  def initialize(name: = nil, date: = nil, condition: = nil, wave_height: = nil, wind: = nil, weather: = nil)
  #will collect all data(developed by scrape class) to be used in the cli
  end
end
