require_relative "methods/create_account"
require_relative "methods/sign_in"
require_relative "methods/panels/admin_panel"
require_relative "strings/menu_text"

puts <<~ASCII_ART
 .----------------.    .----------------.    .----------------.    .-----------------.   .----------------. 
| .--------------. |  | .--------------. |  | .--------------. |  | .--------------. |  | .--------------. |
| |     _____    | |  | |   ______     | |  | |      __      | |  | | ____  _____  | |  | |  ___  ____   | |
| |    |_   _|   | |  | |  |_   _ \\    | |  | |     /  \\     | |  | ||_   \\|_   _| | |  | | |_  ||_  _|  | |
| |      | |     | |  | |    | |_) |   | |  | |    / /\\ \\    | |  | |  |   \\ | |   | |  | |   | |_/ /    | |
| |      | |     | |  | |    |  __'.   | |  | |   / ____ \\   | |  | |  | |\\ \\| |   | |  | |   |  __'.    | |
| |     _| |_    | |  | |   _| |__) |  | |  | | _/ /    \\ \\_ | |  | | _| |_\\   |_  | |  | |  _| |  \\ \\_  | |
| |    |_____|   | |  | |  |_______/   | |  | ||____|  |____|| |  | ||_____|\\____| | |  | | |____||____| | |
| |              | |  | |              | |  | |              | |  | |              | |  | |              | |
| '--------------' |  | '--------------' |  | '--------------' |  | '--------------' |  | '--------------' |
 '----------------'    '----------------'    '----------------'    '----------------'    '----------------' 
ASCII_ART

ihsan_bey=Customer.new("ihsan aycan","1234",-10500)
ali_bey=Customer.new("ali daşbaşı","5678",1000)
burak_bey=Customer.new("burak yılmaz","1122",200000)
ahmet_bey=Customer.new("ahmet yılmaz","3344",0)
tülin_hanım=Customer.new("tülin özen","5566",1000)




menu_loop = false
puts MENU_TEXT

while true
  if menu_loop
    puts MENU_TEXT
    menu_loop = false
  end

  choice = gets.chomp.to_i

  case choice
  when 1
    create_account
    menu_loop = true
  when 2
    menu_loop=sign_in
  when 3
    puts "Çıkış yapıldı... Bizi Tercih Ettiğiniz İçin Teşekkürler!"
    break
  when 999
    puts "Admin kullanıcı bilgilerini giriniz"
    menu_loop = admin_panel
  else
    puts "\nGeçersiz işlem. Lütfen tekrar deneyin."
    menu_loop = true
  end
end
