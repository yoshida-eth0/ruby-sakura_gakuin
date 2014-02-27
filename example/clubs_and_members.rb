$LOAD_PATH << File.expand_path("../lib", File.dirname(__FILE__))

require 'sakura_gakuin'
require 'pp'

SakuraGakuin::Club.each do |club|
  puts club.name
  club.club_members.each do |club_member|
    puts "  #{club_member.name}（#{club_member.admission_date}〜#{club_member.graduation_date}）"
  end
  puts "=============================="
end
