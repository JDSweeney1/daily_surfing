class DailySurfing::Cli

  def self.run
    #this is what will be used to run the the Cli
    #it will give options to choose which region, then provide future
    # 1. Region swell height 2. Future date 3. Surf condition(poor - good)
    # 4. A brief description of wind 5. weather for that day and region

    #you will also be able to select individual attributes for each region
    puts "welcome to Daily Surfing!"
    puts "Get your 3 day forecast for the entire east coast of Florida by typing 'all'"
    puts "Or select one of four regions using their corresponding number.
     1. North Florida
     2. Central Florida
     3. Treasure Coast - Palm Beach
     4. Boward - Miami Dade"

  end
end
