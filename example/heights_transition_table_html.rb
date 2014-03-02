#
# メンバーの身長推移をHTMLで出力する。
#

$LOAD_PATH << File.expand_path("../lib", File.dirname(__FILE__))

require 'sakura_gakuin'
require 'json'

def month_each
  date = Date.new(2010, 4, 1)
  today = Date.today
  while date<=today
    yield date
    date = date >> 1
  end
end

# header
headers = ["Date"]
SakuraGakuin::Member.each do |member|
  headers << member.name
end

# body rows
rows = [headers]
month_each do |month|
  row = [month.strftime("%Y-%m")]
  SakuraGakuin::Member.each do |member|
    row << member.month_heights.to_hash[month]
  end
  rows << row
end

puts <<EOF
<html>
  <head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable(#{JSON.generate(rows)});

        var options = {
          title: "さくら学院メンバーの身長推移",
          titlePosition: "in",
          interpolateNulls: true,
          chartArea: {left: 30, top: 0, width: "85%", height: "95%"},
          vAxis: {
            viewWindow: {max: 175, min:125},
            gridlines: {count: 10}
          },
          hAxis: {slantedTextAngle: 90},
          legend: {alignment: "center"},
          titleFontSize: 16,
          fontSize: 10,
          pointSize: 5
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="chart_div" style="width: 800px; height: 900px;"></div>
  </body>
</html>
EOF
