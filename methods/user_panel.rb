require_relative "../strings/errors"
require_relative "../strings/menu_text"
require_relative "../classes/CustomerData"
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
        return true
      else
        puts "\nGeçersiz işlem. Lütfen tekrar deneyin."
        menu_loop = true
      end
  end
end
