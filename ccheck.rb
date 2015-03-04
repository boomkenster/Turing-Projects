class CreditCardCheck
#def credit_card(num)

  def check(num)
    cc_num = []
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

end

mastercard = CreditCardCheck.new
puts mastercard.check("5541808923795240")
puts mastercard.check("4024007136512380")
puts mastercard.check("6011797668867828")
puts mastercard.check("5541801923795240")
puts mastercard.check("4024007106512380")
puts mastercard.check("6011797668868728")
