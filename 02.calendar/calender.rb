require "date"
require "optparse"
#入力部
params = ARGV.getopts("y:","m:")
year_input = params["y"].to_i
month_input = params["m"].to_i
if year_input == 0
  year_input = Date.today.year
end
if month_input == 0
  month_input = Date.today.mon
end

#今日の日付、月の始め、終わりを作る
firstday = Date.new(year_input,month_input,1)
lastday = Date.new(year_input,month_input,-1)

#カレンダートップの装飾
puts "　　　#{month_input}月　#{year_input}"
puts "日 月 火 水 木 金 土"

#1日目の曜日まで表示をずらす
#wday→曜日の判定。日曜日0~土曜日6
firstday.wday.times do
  print "   "
end

#日付の表示
(firstday.day..lastday.day).each do |day|
  print format("%2d ", day)
  if Date.new(year_input,month_input,day).saturday?
    print "\n"
  end
end
print "\n"
