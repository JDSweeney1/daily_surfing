class Surf_Data
  include Attributes

  def initialize(name = nil, date = nil, condition = nil, wave_height = nil, wind = nil, weather = nil, weather_temp = nil)
    @name = name
    @date = date
    @condition = condition
    @wave_height = wave_height
    @wind = wind
    @weather = weather
    @weather_temp = weather_temp
  end
end
