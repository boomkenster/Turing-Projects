#create code that started from the right, moving left
#double the value of every second digit
#if the value of any digit is greater than 9 add the two digits together
#take sum of all digits
#when divided by 10 reminder shuold be 10

def credit_card(num)
  cc_num = []
  # num = num.to_s
  n = 0
  b = num.length - 2
    while n < num.length
      cc_num << num[n]
      n += 1
    end

    while b > -1
      cc_num[b] = cc_num[b].to_i * 2
      b -= 2
    end

    cc_num.map! do |n|
      if n.to_i > 9
        n.to_i - 9
      else
        n.to_i
      end
    end

    puts cc_num

    sum = 0
    cc_num.each do |n|
      sum += n.to_i
    end

    puts sum

    if sum % 10 == 0
      puts "Valid"
    else
      puts "Invalid"
    end

end


puts credit_card("5541808923795240")
puts credit_card("4024007136512380")
puts credit_card("6011797668867828")
puts credit_card("5541801923795240")
puts credit_card("4024007106512380")
puts credit_card("6011797668868728")

# cc_num << num[0]
# cc_num << num[1]
# cc_num << num[2]
# cc_num << num[3]
# cc_num << num[4]
# cc_num << num[5]
# cc_num << num[6]
# cc_num << num[7]
# cc_num << num[8]
# cc_num << num[9]
# cc_num << num[10]
# cc_num << num[11]
# cc_num << num[12]
# cc_num << num[13]
# cc_num << num[14]
# cc_num << num[15]


# cc_num[14] = cc_num[14].to_i * 2
# cc_num[12] = cc_num[12].to_i * 2
# cc_num[10] = cc_num[10].to_i * 2
# cc_num[8] = cc_num[8].to_i * 2
# cc_num[6] = cc_num[6].to_i * 2
# cc_num[4] = cc_num[4].to_i * 2
# cc_num[2] = cc_num[2].to_i * 2
# cc_num[0] = cc_num[0].to_i * 2
