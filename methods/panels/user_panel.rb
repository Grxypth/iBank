require_relative "../../strings/errors"
require_relative "../../strings/errors"
require_relative "../../classes/CustomerData"
require_relative "../billify"
require_relative "../utils/utils"
require "byebug"
def user_panel(customer)
  menu_loop = false

  puts USER_MENU_TEXT ## kullanıcı menüsünü yazdır
  while true
    if menu_loop
      puts USER_MENU_TEXT
      menu_loop = false
    end

    choice = gets.chomp.to_i

    case choice
    when 1
      puts "\nBakiye bilgisi: \n"
      puts customer.bakiye ##bakiye görüntüle
      menu_loop = true
    when 2
      puts "Elinizdeki banknotlara göre seçim yapınız"
      transaction_bills, miktar = billify() ## kullanıcıya hangi banknotları kullanarak para yatırmak istediğini sor
      customer.deposit(transaction_bills, miktar) ##yatırılan parayı banknotlara ayır ve kullanıcıya yatır
      menu_loop = true
    when 3
      puts "Çekmek istediğiniz miktarı giriniz"
      miktar = gets.chomp.to_i
      customer.withdraw(miktar) ##çekilecek parayı en düşük banknot miktarından kullanıcıya ver
      menu_loop = true
    when 4
      puts "Eski şifrenizi giriniz"
      old_password = valid_password(gets.chomp)
      puts "Yeni şifrenizi giriniz"
      new_password = valid_password(gets.chomp)
      customer.change_password(old_password, new_password)
      menu_loop = true
    when 5
      return true
    else
      puts "\nGeçersiz işlem. Lütfen tekrar deneyin."
      menu_loop = true
    end
  end
end
