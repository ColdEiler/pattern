def prime(num)
  return false if num <=1
  (2 .. (num-1)).each do |n|
    return false if num % n == 0
  end
  true
end

def max_div(num,proc,proc_1)
  max=0
  num.downto(1).each{|div|  max=div if num % div == 0  && div>max && proc.call(div) && proc_1.call(div)}
  return max
end

def pr_digit(num,proc)
  p=1
  num.digits.each { |n| p*=n if proc.call(n) == true}
  p
end

def nod (a,b)
  if a == b then a
  elsif (a>b) then
    new_a = b
    new_b= a-b
    nod(new_a,new_b)
  else
    new_a=a
    new_b=b-a
    nod(new_a,new_b)
  end
end

def welcome (s)
  puts s
  num = STDIN.gets.chomp.to_i
  num
end

tr=Proc.new{|n| true}

num = welcome( "Введите число для метода  максимальный простой делитель числа")

proc = Proc.new {|n| if prime(n) then true else false end}
p max_div(num,proc,tr)

num=welcome("Введите число для метода: произведение цифр числа, не делящихся на 5")
proc = Proc.new{ |n| if n!=5 then true else false end}
puts pr_digit(num,proc)

num=welcome("Введите число для метода: НОД максимального нечетного непростого делителя
числа и прозведения цифр данного числа.")
nech_max_notprime_div= max_div(num,Proc.new{|n| if n % 2 == 1 then true else false end},Proc.new{|n| if prime(n) then false else true end})
pr_ch = pr_digit(num,tr)
if pr_ch != 0 then
  p nod(pr_ch,nech_max_notprime_div)
else puts "Произведение числа = 0!!!"
end