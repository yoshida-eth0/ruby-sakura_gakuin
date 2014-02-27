$LOAD_PATH << File.expand_path("../lib", File.dirname(__FILE__))

require 'sakura_gakuin'
require 'pp'

SakuraGakuin::Club.each do |club|
  pp club
  puts "=============================="
end
