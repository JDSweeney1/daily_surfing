class DailySurfing::Scraper
  def broward_miami_dade
    #I want this to scrape one of four pages, each used for a different region.
    #fake surf_data
    #open html and nokogiri go here

    name = "broward_miami_dade"
    date = "12/05"
    condition = "fair"
    wave_height = "2-3ft"
    wind = "LP LP LP"
    weather = "Tornado"

    DailySurfing::Surf_Data.new(name: = name, date: = date, condition: = condition, wave_height: = wave_height, wind: = wind, weather: = weather)

  end
end
