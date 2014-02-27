$LOAD_PATH << File.expand_path("../lib", File.dirname(__FILE__))

require 'sakura_gakuin'

def month_each
  date = Date.new(2010, 4, 1)
  today = Date.today
  while date<=today
    yield date
    date = date >> 1
  end
end

row = []
row << ""
month_each do |month|
  row << month.strftime("%Y-%m")
end
puts row.join("\t")

SakuraGakuin::Member.each do |member|
  row = []
  row << member.name
  #heights = member.month_heights
  heights = member.month_heights.to_hash
  month_each do |month|
    row << heights[month]
  end
  puts row.join("\t")
end
