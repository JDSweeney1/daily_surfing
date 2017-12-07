require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  include Attributes

  def initialize(url)
    #html = File.read("url")
    surf_report = Nokogiri::HTML(open(url))
    binding.pry
    #binding.pry
    #fake surf_data
    #date: surf_report.css("div.day-slider-container div div span").first.text
    data = surf_report.css("div.day-slider-container div div span").collect{|t| t.text}.delete_if{|k| k.include?("Kurt")}
    #data[0] = first day  data[1] = brief description data[2] = wind description
    #data[3] = second day data[4] = brief description data[5] = wind description
    #data[6] = third day  data[7] = brief description data[8] = wind description
    #data[9] = first day weather data[10].gesub('\u00B0', "") = first day temp

    condition = surf_report.css("div.day-slider-container div div strong").collect{|w| w.text}
    #condition[0] = day 1 condition[1] = day 2 condition[2] = day 3
    wave = surf_report.css("div.day-slider-container h1").collect{|h| h.text}
=begin
    ["Wednesday - 12/06",
 "ankle to knee high",
 "Small SE windswell with SE winds.  ",
 "Thursday - 12/07",
 "Flat",
 "Minimal windswell traces. Light winds.  ",
 "Friday - 12/08",
 "Flat",
 "Minimal traces. Light winds.  ",
 "scattered showers",
 "71-83\u00B0 F",
 "sunny",
 "70-83\u00B0 F",
 "scattered showers",
 "71-82\u00B0 F"]
=end
    @date1 = data[0]
    @date2 = data[3]
    @date3 = data[6]
    @condition1 = condition[0]
    @condition2 = condition[1]
    @condition3 = condition[0]
    @wave_height1 = wave[0]
    @wave_height1 = wave[1]
    @wave_height1 = wave[2]
    @wind1 = data[2]
    @wind2 = data[5]
    @wind3 = data[8]
    @weather1 = data[9]
    @weather1 = data[11]
    @weather1 = data[13]
    @weather_temp = data[10].gsub(/\u00B0/, "")
    @weather_temp = data[12].gsub(/\u00B0/, "")
    @weather_temp = data[14].gsub(/\u00B0/, "")
  end

  def self.broward_miami_dade
    #I want this to scrape one of four pages, each used for a different region.
    scraper = self.new("http://www.surfline.com/surf-forecasts/florida/broward---miami-dade_121124/")
    Surf_Data.new(scraper.name, scraper.date, scraper.condition, scraper.wave_height, scraper.wind, scraper.weather)

  end

  def self.palm_beach
    #I want this to scrape one of four pages, each used for a different region.
    scraper = self.new("url")
    Surf_Data.new(scraper.name, scraper.date, scraper.condition, scraper.wave_height, scraper.wind, scraper.weather)

  end

  def self.cental_florida
    #I want this to scrape one of four pages, each used for a different region.
    scraper = self.new("url")
    Surf_Data.new(scraper.name, scraper.date, scraper.condition, scraper.wave_height, scraper.wind, scraper.weather)

  end

  def self.north_florida
    #I want this to scrape one of four pages, each used for a different region.
    scraper = self.new("url")
    Surf_Data.new(scraper.name, scraper.date, scraper.condition, scraper.wave_height, scraper.wind, scraper.weather)

  end
end
