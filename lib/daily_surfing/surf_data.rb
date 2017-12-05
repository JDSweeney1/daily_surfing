
class Surf_Data
  attr_accessor :name

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
    puts "#{name}"
  end
end
Surf_Data.new("hello")
