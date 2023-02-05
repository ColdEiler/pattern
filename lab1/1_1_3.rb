user = ARGV[0]
input = STDIN.gets
name = input.chomp

puts "#{name}, введи команду Ruby: "
ruby_com = STDIN.gets.chomp
system "ruby -e \"#{ruby_com}\""

puts "#{name}, введи команду ОС: "
os_com = STDIN.gets.chomp
system "#{os_com}"