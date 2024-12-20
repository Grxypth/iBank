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

menu_loop = false
puts MENU_TEXT
CustomerLoader.load_customers("customer_data.json")

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
    menu_loop = sign_in
  when 3
    puts "Çıkış yapıldı... Bizi Tercih Ettiğiniz İçin Teşekkürler!"
    break
  when 999
    puts "Admin kullanıcı bilgilerini giriniz" # admin paneline giriş yapmak için
    menu_loop = admin_panel
  else
    puts "\nGeçersiz işlem. Lütfen tekrar deneyin."
    menu_loop = true
  end
end
