class Surf_Data
  include Attributes

  def initialize(name = nil, date = nil, condition = nil, wave_height = nil, wind = nil, weather = nil)
  #will collect all data(developed by scrape class) to be used in the cli
  @name = name
  @date = date
  @conditin = condition
  @wave_height = wave_height
  @wind = wind
  @weather = weather
  end
end
