require_relative "../strings/menu_text"
def billify
  
  bills = { "200": 0, "100": 0, "50": 0, "20": 0, "10": 0, "5": 0 }
  menu_loop = false
  puts DEPOSIT_TEXT
 
 
 
 while true
    if menu_loop
      puts DEPOSIT_TEXT_REPEAT
      menu_loop = false
    end
    choice = gets.chomp.to_i

    case choice
    when 1
     puts BANKNOT_TEXT
     amount=gets.chomp.to_i
      bills[:"200"] += amount
      menu_loop = true
    when 2
      puts BANKNOT_TEXT
      amount=gets.chomp.to_i
      bills[:"100"] += amount
      menu_loop = true
    when 3
      puts BANKNOT_TEXT
      amount=gets.chomp.to_i
      bills[:"50"] += amount

      menu_loop = true
    when 4
      puts BANKNOT_TEXT
      amount=gets.chomp.to_i
      bills[:"20"] += amount


     
      menu_loop = true
    when 5
      puts BANKNOT_TEXT
      amount=gets.chomp.to_i
      bills[:"10"] += amount


     
      menu_loop = true
    when 6
      puts BANKNOT_TEXT
      amount=gets.chomp.to_i
      bills[:"5"] += amount
     
      menu_loop = true
    when 7
      miktar = 0
      bills.each do |key,value|
      bill_data= key.to_s.to_i
      miktar+=bill_data*value  
      end
      return bills,miktar
    else
      puts "\nGeçersiz işlem. Lütfen tekrar deneyin."
      menu_loop = true
    end
  end

end