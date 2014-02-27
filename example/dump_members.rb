$LOAD_PATH << File.expand_path("../lib", File.dirname(__FILE__))

require 'sakura_gakuin'
require 'pp'

SakuraGakuin::Member.each do |member|
  pp member
  puts "=============================="
end
