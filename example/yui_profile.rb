$LOAD_PATH << File.expand_path("../lib", File.dirname(__FILE__))

require 'sakura_gakuin'
require 'pp'

yui = SakuraGakuin::Member[:yui_mizuno]

puts "Name(ja): #{yui.name_ja}"
puts "Name(en): #{yui.name_en}"
puts "Nicknames: #{yui.nicknames.join(" ")}"
puts "Birthday: #{yui.birthday}"
puts "Age: #{yui.age}"
puts "Birthplace: #{yui.birthplace}"
puts "DiaryURL: #{yui.diary_url}"
puts

puts "Heights:"
yui.heights.each do |date, height|
  puts "  #{date}: #{height}"
end
puts

puts "AdmissionDate: #{yui.admission_date}"
puts "GraduationDate: #{yui.graduation_date}"
puts

puts "Introductions:"
yui.introductions.each do |year, introduction|
  puts "  #{year}:"
  puts introduction.gsub(/^/, "    ")
end
puts

puts "Attendances:"
yui.attendances.each do |year, attendance|
  puts "  #{year}: #{attendance}"
end
puts

puts "Clubs:"
yui.club_members.each do |club_member|
  puts "  #{club_member.name} in #{club_member.club.name}（#{club_member.admission_date}〜#{club_member.graduation_date}）"
end
