require_relative "../strings/errors"
require_relative "../strings/menu_text"
require_relative "../classes/CustomerData"
require "byebug"
## eğer bu paneli kullanmaya devam etmek istiyorsanız bu method false döndürmeli, eğer bir önceki menüye dönmek istiyorsanız true döndürmelidir.
def admin_panel
  admin_username = "admin"
  admin_password = "admin"
  is_admin = false
  menu_loop = false
  exit_panel = false

  print "Kullanıcı adı: "
  username = gets.chomp
  print "Şifre: "
  password = gets.chomp

  if username == admin_username && password == admin_password
    is_admin = true
  else
    puts ADMIN_AUTH_ERROR
    return true
  end

  puts ADMIN_MENU_TEXT
  while true
    if is_admin
      if menu_loop
        puts ADMIN_MENU_TEXT
        menu_loop = false
      end

      choice = gets.chomp.to_i

      case choice
      when 1
        puts "\nList of customers: \n"
        Customer.all_customers.each { |customer| puts "#{customer.isim}\n" }
        menu_loop = true
        exit_panel = false
      when 2
        return true
      else
        puts "\nGeçersiz işlem. Lütfen tekrar deneyin."
        menu_loop = true
      end
    end
  end
end
