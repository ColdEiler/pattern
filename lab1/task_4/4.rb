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
  arr.each do |n| y=arr.slice(arr.index(n)+1)
  return true if y == nil
  return false if n*y >0
  end
  true
end

def arr_sum_in_interval (arr,a,b)
  arr_2=arr.filter{|n| n<b && n>a}
  arr_2.sum
end

def count_el(arr)
  arr_2 = arr.filter{|n| n > arr[0..arr.index(n)-1].sum}
  arr_2.count
end

#p el_until_last_min([10,1,5,3,2,1])
#p el_after_first_max([10,1,2,10,3,4])
#p arr_plus_minus([10,-2,3,3,1])
#p arr_sum_in_interval([10,1,2,3,4,10],0,5)
#p count_el([1,1,3,6,15])