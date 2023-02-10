user = ARGV[0]

puts "#{user}, введи команду Ruby: "
ruby_com = STDIN.gets.chomp
system "ruby -e \"#{ruby_com}\""

puts "#{user}, введи команду ОС: "
os_com = STDIN.gets.chomp
system "#{os_com}"