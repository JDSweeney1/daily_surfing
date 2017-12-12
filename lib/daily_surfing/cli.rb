class Cli

  def self.run
    puts "welcome to Daily Surfing!"

    loop do
      puts ""
      puts "Get your 3 day forecast for the entire east coast of Florida by typing 'all'"
      puts "Or select one of four regions using their corresponding number."
      self.display
      puts "         -----Type 'exit' to exit-----"
     input = gets.strip
     if input == "all"
       self.all(["north_florida", "central_florida", "palm_beach", "broward_miami_dade"])
     elsif input == "1"
      # self.output_north_florida
       self.output("north_florida")
       self.start_over?
     elsif input == "2"
       self.output("central_florida")
       self.start_over?
     elsif input == "3"
       self.output("palm_beach")
       self.start_over?
    elsif input == "4"
       self.output("broward_miami_dade")
       self.start_over?
     elsif input == "exit"
       puts ""
       puts ""
       puts "Thank you, please come again!"
       exit
     else
       puts "I'm sorry, I didn't catch that. Please type all, 1, 2, 3, or 4"
     end
   end
 end

 def self.output(variable)
   report = Scraper.send variable
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
   puts ""
   puts ""
 end

 def self.start_over?
   puts "Would you like to go back to the main menu? (Yes/No)"
   input = gets.upcase.strip
   if input == ("NO" || "EXIT")
     puts ""
     puts ""
     puts "Thank you, please come again!"
     exit
   end
 end

 def self.all(variable)
   variable.each do |name|
     report = Scraper.send name
     self.cli_outline(report)
   end
   self.start_over?
 end

 def self.display
   names = ["North Florida", "Central Florida", "Palm Beach", "Broward - Miami Dade"]
   names.each.with_index(1) {|n, i| puts "#{i}. #{n}"}
 end
end
