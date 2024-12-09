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
puts "iBank'a hoşgeldiniz!"
puts "Lütfen yapmak istediğiniz işlemi seçin:"
puts "1. Hesap Aç\n2. Giriş Yap \n3. Çıkış"
menu_loop = false

while true
  if menu_loop
    puts "Lütfen yapmak istediğiniz işlemi seçin:"
    puts "1. Hesap Aç\n2. Giriş Yap \n3. Çıkış"
    menu_loop = false
  end

  choice = gets.chomp.to_i

  case choice
  when 1
    puts "Hesap açma işlemi seçildi."
    break
  when 2
    puts "Giriş yapma işlemi seçildi."
    break
  when 3
    puts "Çıkış yapıldı... Bizi Tercih Ettiğiniz İçin Teşekkürler!"
    break
  else
    puts "Geçersiz işlem. Lütfen tekrar deneyin."
    menu_loop = true
  end
end
