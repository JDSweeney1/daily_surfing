rewquire_relative '../config/environment'
class Cli

  @@class = []

  def initialize
    @@class << self
    puts "#{@@class}"
    #testing


  end
end
