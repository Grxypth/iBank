require_relative '../../strings/errors'
require_relative '../../strings/errors'
require_relative "../../classes/CustomerData"
require_relative "../billify"
require "byebug"
## eğer bu paneli kullanmaya devam etmek istiyorsanız bu method false döndürmeli, eğer bir önceki menüye dönmek istiyorsanız true döndürmelidir.
def user_panel(customer)
  menu_loop = false

  puts USER_MENU_TEXT
  while true
    if menu_loop
      puts USER_MENU_TEXT
      menu_loop = false
    end

    choice = gets.chomp.to_i

    case choice
    when 1
      puts "\nBakiye bilgisi: \n"
      puts customer.bakiye
      menu_loop = true
    when 2
      puts "Elinizdeki banknotlara göre seçim yapınız"
      transaction_bills,miktar= billify()
      customer.deposit(transaction_bills,miktar)
      menu_loop=true      
    when 3
      puts "Çekmek istediğiniz miktarı giriniz"
      miktar = gets.chomp.to_i
      customer.withdraw(miktar)
      menu_loop = true
    when 4
      puts "Eski şifrenizi giriniz"
      if gets.chomp == customer.password
        puts "Yeni şifrenizi giriniz"
        new_password = gets.chomp
        customer.password = new_password
        puts "Şifreniz başarıyla değiştirildi."
        menu_loop = true
      else
        puts "Şifreniz yanlış lütfen tekrar deneyin"
        menu_loop = true
      end
    when 5
      return true
    else
      puts "\nGeçersiz işlem. Lütfen tekrar deneyin."
      menu_loop = true
    end
  end
end
