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

def task()
  p "Введите путь к файлу"
  filepath = gets
  file = File.open("#{filepath.chomp}")
  data = file.readline.split(' ').map{|item|item.to_i }
  p "Массив: #{data}"
  p "Выберете функцию 1 или 2 "

  p " 1 - минимум массива"
  p "2 - индекс первого положительного элемента"
  choice = gets.chomp
  case choice
  when "1"
    p find_min(data)
  when "2"
    p find_first_pos_el(data)
  else
    p "Чел, ты не справился"
    end
end
task()