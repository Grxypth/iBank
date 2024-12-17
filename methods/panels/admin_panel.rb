require_relative "../../strings/errors"
require_relative "../../strings/menu_text"
require_relative "../../classes/CustomerData"
require "byebug"
## eğer bu paneli kullanmaya devam etmek istiyorsanız bu method false döndürmeli, eğer bir önceki menüye dönmek istiyorsanız true döndürmelidir.
def admin_panel
  admin_username = "admin"
  admin_password = "admin"
  is_admin = false
  menu_loop = false

  print "Kullanıcı adı: "
  username = gets.chomp
  print "Şifre: "
  password = gets.chomp

  if username == admin_username && password == admin_password
    is_admin = true
  else
    puts AUTH_ERROR
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
        puts "\nMüşterilerin listesi: \n" ##müşterilerin listesini yazdır
        Customer.customers.each do |customer|
          puts "isim:#{customer.isim} \nşifre:#{customer.password} \ngünlük limit:#{customer.daily_limit}\n\n"
        end
        menu_loop = true
      when 2 #günlük işlem limiti değiştirme
        puts "\nLimitini değiştirmek istediğiniz kullanıcının ismini giriniz."
        isim = validate_letter(gets.chomp)
        puts "\nLimit miktarını giriniz"
        limit = validate_number(gets.chomp)
        Customer.change_limit(isim, limit)
        menu_loop = true
      when 3
        return true
      else
        puts "\nGeçersiz işlem. Lütfen tekrar deneyin."
        menu_loop = true
      end
    end
  end
end
