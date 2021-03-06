#
# 水野由結ちゃんのプロフィールを出力する。
#

$LOAD_PATH << File.expand_path("../lib", File.dirname(__FILE__))

require 'sakura_gakuin'
require 'pp'

yui = SakuraGakuin::Member[:yui_mizuno]

puts "ID: #{yui.id}"
puts "Name(ja): #{yui.name_ja}"
puts "Name(en): #{yui.name_en}"
puts "Nicknames: #{yui.nicknames.join(" ")}"
puts "Birthday: #{yui.birthday}"
puts "Age: #{yui.age}"
puts "Grade(ja): #{yui.grade_ja}"
puts "Grade(en): #{yui.grade_en}"
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
puts

angel = yui.angel
if angel
  puts "Angel:"
  puts "  Name(ja): #{angel.name_ja}"
  puts "  Name(en): #{angel.name_en}"
  puts "  Catchphrase: #{angel.catchphrase}"
  puts "  Hobby: #{angel.hobby}"
  puts "  Worry: #{angel.worry}"
  puts "  FavoriteSubject: #{angel.favorite_subject}"
  puts "  Emoticon: #{angel.emoticon}"
end
