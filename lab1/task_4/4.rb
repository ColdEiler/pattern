#+1.9 Дан целочисленный массив. Необходимо найти элементы,
# расположенные перед последним минимальным

#+1.21 Дан целочисленный массив. Необходимо найти элементы,
# расположенные после первого максимального.

#+1.33 Дан целочисленный массив. Проверить, чередуются ли в нем
# положительные и отрицательные числа.

# +1.45 Дан целочисленный массив и интервал a..b. Необходимо найти
# сумму элементов, значение которых попадает в этот интервал.

#+1.57 Для введенного списка найти количество таких элементов, которые
#больше, чем сумма всех предыдущих.

def index_min(arr)
  arr.index(arr.min)
end

def index_max(arr)
  arr.index(arr.min)
end

def el_until_last_min(arr)
  arr_rev = arr.reverse
  arr[0..(arr.size - index_min(arr_rev)-2)]
end

def el_after_first_max(arr)
  arr[index_max(arr)..arr.size-1]
end

def arr_plus_minus(arr)

  arr2=arr.filter{|n| y=arr[arr.index(n)+1]
  if y != nil then n*y>0 end}
  arr2.empty?
end

def arr_sum_in_interval (arr,a,b)
  arr_2=arr.filter{|n| n<b && n>a}
  arr_2.sum
end

def count_el(arr)
  arr_2 = arr.filter{|n| if arr.index(n) == 0 then n > 0 else n > arr[0..arr.index(n)-1].sum end}
  arr_2.count
end

filepath = "C:/Users/Владислав/RubymineProjects/labs/lab1/task_4/arr.txt"
file = File.open("#{filepath}")
arr = file.readline.split(' ').map{|item|item.to_i }

puts "Массив: #{arr}"
puts "Выберете функцию"

puts " 1 - Нахождение элементов,расположенные перед последним минимальным"
puts "2 - Нахождение элементов, расположенные после первого максимального."
puts "3 - Проверить, чередуются ли в нем положительные и отрицательные числа."
puts "4 - Нахождение количества таких элементов, которые больше, чем сумма всех предыдущих."
puts "5 - Дан интервал a..b. Необходимо найти сумму элементов, значение которых попадает в этот интервал"

choice = STDIN.gets.chomp
case choice
when "1"
  puts el_until_last_min(arr)
when "2"
  puts el_after_first_max(arr)
when "3"
  puts arr_plus_minus(arr)
when "4"
  puts count_el(arr)
when "5"
  puts "Введите интервал"
  a=STDIN.gets.chomp.to_i
  b=STDIN.gets.chomp.to_i
  puts arr_sum_in_interval(arr,a,b)
else
  p "Чел, ты не справился"
end