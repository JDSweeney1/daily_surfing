class Surf_Data
  attr_accessor :name, :date, :condition, :wave_height, :wind, :weather

  def initialize(name = nil, date = nil, condition = nil, wave_height = nil, wind = nil, weather = nil)
  #will collect all data(developed by scrape class) to be used in the cli
  @name = name
  @date = date
  @conditin = condition
  @wave_height = wave_height
  @wind = wind
  @weather = weather
  end

  def full_report(name = nil, date = nil, condition = nil, wave_height = nil, wind = nil, weather = nil)
    report = self.new(name, date, condition, wave_height, wind, weather)
    puts "#{report.name}"
    puts "#{report.date}"
  end

  def output
    Scraper.broward_miami_dade
  end

end
