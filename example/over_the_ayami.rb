#
# メンバー毎の彩未ちゃんの身長を抜かした月を出力する。
#

$LOAD_PATH << File.expand_path("../lib", File.dirname(__FILE__))

require 'sakura_gakuin'
require 'pp'

ayami = SakuraGakuin::Member[:ayami_muto]

SakuraGakuin::Member.reject{|member| member.id==:ayami_muto}.each do |member|
  over_the_ayami_date = ""

  member.month_heights.each do |date, height|
    if ayami.month_height(date)<height
      over_the_ayami_date = date.strftime("%Y-%m")
      break
    end
  end

  diff = member.height - ayami.height

  puts sprintf("%-18s %-10s %+d", member.name_en, over_the_ayami_date, diff)
end
