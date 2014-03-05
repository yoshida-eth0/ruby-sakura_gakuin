#
# 2011年度卒業式当日のメンバーと当時の年齢の一覧を出力する。
#

$LOAD_PATH << File.expand_path("../lib", File.dirname(__FILE__))

require 'sakura_gakuin'
require 'timecop'

Timecop.travel(Date.new(2012, 3, 25)) do
  SakuraGakuin::Member.select(&:active?).each do |member|
    puts "#{member.name}(#{member.age})"
  end
end
