user = ARGV[0]
puts "Здаров,#{user},жив?"

puts "Какой ЯП любишь, бро?"
choice = STDIN.gets.chomp.downcase

case choice
when "ruby"
  puts "Чел, а ты подлиза"
when "c"
  puts "Ууу, а ты любишь по жесткому"
when "pascal"
  puts "ООО, Кирилл Цветков, как поживаешь?"
when "1c"
  puts "ООО, а ты из ПИ?"
when "java"
  puts "ООО, попей кофе?"
when "js"
  puts "2+2=22"
when "python"
  puts "Чел, ты позер"
else
  puts "скоро будет ruby "
end