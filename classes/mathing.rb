def withdraw(miktar)
end

puts "Çekmek istediğiniz miktarı giriniz"
miktar = gets.chomp.to_i
bills = { "200": 0, "100": 0, "50": 0, "20": 0, "10": 0, "5": 0 }

bills.each do |key, value|
  bill_data = key.to_s.to_i

  if miktar >= bill_data
    bill_count = miktar / bill_data
    bills[key] = bill_count
    remaining = miktar - (bill_data * bill_count)
    miktar = remaining
  end
end
puts bills.values
