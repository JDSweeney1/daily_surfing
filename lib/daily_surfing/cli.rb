class Cli

  def self.run
    #this is what will be used to run the the Cli
    #it will give options to choose which region, then provide future
    # 1. Region swell height 2. Future date 3. Surf condition(poor - good)
    # 4. A brief description of wind 5. weather for that day and region

    #you will also be able to select individual attributes for each region
    puts "welcome to Daily Surfing!"

    loop do
      puts ""
      puts "Get your 3 day forecast for the entire east coast of Florida by typing 'all'"
      puts "Or select one of four regions using their corresponding number.
       1. North Florida
       2. Central Florida
       3. Treasure Coast - Palm Beach
       4. Broward - Miami Dade"
      puts "         -----Type 'exit' to exit-----"
     input = gets.strip
     if input == "all"
       self.output_north_florida
       puts ""
       self.output_cental_florida
       puts ""
       self.output_palm_beach
       puts ""
       self.output_broward_miami_dade
       puts ""
       #will have an ask feature that asks if they want to go back to main menu or exit
     elsif input == "1"
       self.output_north_florida
     elsif input == "2"
        self.output_cental_florida
     elsif input == "3"
       self.output_palm_beach
    elsif input == "4"
       self.output_broward_miami_dade
     elsif input == "exit"
       exit
     else
       #have some sort of error message.
       #restart at top.
       puts "here is wrong"
     end
   end

 end

 def self.output_broward_miami_dade
  report = Scraper.broward_miami_dade
   puts "#{report.name}"
   puts "#{report.wave_height}"
 end

 def self.output_palm_beach
  report = Scraper.palm_beach
   puts "#{report.name}"
   puts "#{report.wave_height}"
 end

 def self.output_cental_florida
  report = Scraper.cental_florida
   puts "#{report.name}"
   puts "#{report.wave_height}"
 end

 def self.output_north_florida
  report = Scraper.north_florida
   puts "#{report.name}"
   puts "#{report.wave_height}"
 end
end
