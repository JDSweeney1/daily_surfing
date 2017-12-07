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
       puts ""
       self.output_cental_florida
       puts ""
       puts ""
       self.output_palm_beach
       puts ""
       puts ""
       self.output_broward_miami_dade
       puts ""
       puts ""
       self.start_over?
       #will have an ask feature that asks if they want to go back to main menu or exit
     elsif input == "1"
       self.output_north_florida
       puts ""
       puts ""
       self.start_over?
     elsif input == "2"
        self.output_cental_florida
        puts ""
        puts ""
        self.start_over?
     elsif input == "3"
       self.output_palm_beach
       puts ""
       puts ""
       self.start_over?
    elsif input == "4"
       self.output_broward_miami_dade
       puts ""
       puts ""
       self.start_over?
     elsif input == "exit"
       puts ""
       puts ""
       puts "Thank you, please come again!"
       exit
     else
       #have some sort of error message.
       #restart at top.
       puts "I'm sorry, I didn't catch that. Please type all, 1, 2, 3, or 4"
     end
   end

 end

 def self.output_broward_miami_dade
   report = Scraper.broward_miami_dade
   self.cli_outline(report)
 end

 def self.output_palm_beach
   report = Scraper.palm_beach
   self.cli_outline(report)
 end

 def self.output_cental_florida
   report = Scraper.cental_florida
   self.cli_outline(report)
 end

 def self.output_north_florida
   report = Scraper.north_florida
   self.cli_outline(report)
 end

 def self.cli_outline(report)
   puts "#{report.name}"
   puts "------------------------------------------------------------------------------------------------------------------"
   puts "#{report.date[0]} | Wave height: #{report.wave_height[0]} | Surfing Conditions: #{report.condition[0]} | Weather: #{report.weather[0]} - #{report.weather_temp[0]} |"
   puts ""
   puts "#{report.wind[0]}"
   puts "------------------------------------------------------------------------------------------------------------------"
   puts "#{report.date[1]} | Wave height: #{report.wave_height[1]} | Surfing Conditions: #{report.condition[1]} | Weather: #{report.weather[1]} - #{report.weather_temp[1]} |"
   puts ""
   puts "#{report.wind[1]}"
   puts "------------------------------------------------------------------------------------------------------------------"
   puts "#{report.date[2]} | Wave height: #{report.wave_height[2]} | Surfing Conditions: #{report.condition[2]} | Weather: #{report.weather[2]} - #{report.weather_temp[2]} |"
   puts ""
   puts "#{report.wind[2]}"
   puts "------------------------------------------------------------------------------------------------------------------"
 end

 def self.start_over?
   puts "Would you like to go back to the main menu? (Yes/No)"
   input = gets.upcase.strip
   if input == "NO"
     puts ""
     puts ""
     puts "Thank you, please come again!"
     exit
   end
 end
end
