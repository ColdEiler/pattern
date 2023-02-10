def find_min(arr)
  return nil if arr.empty?
  min = arr[0]
  for i in arr
    if i < min
      min=i
    end
  end
  min
end

def find_first_pos_el(arr)
  for i in 0 .. arr.length
    if arr[i]>0
      return i
    end
  end
  -1
end

choice = ARGV[0]
filepath = ARGV[1]
file = File.open("#{filepath}")
data = file.readline.split(' ').map{|item|item.to_i }
p "Массив: #{data}"
p "Вы Выбрали функцию #{choice} "
case choice
when "1"
  p find_min(data)
when "2"
  p find_first_pos_el(data)
else
  p "Чел, ты не справился"
end

