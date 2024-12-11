require_relative "../classes/CustomerData"
require_relative "./panels/user_panel"

def sign_in
  puts "İsim ve soyisminizi giriniz"
  isim = validate_letter(gets.chomp.downcase)
  puts "Şifrenizi giriniz"
  password = valid_password(gets.chomp)
  customer_found = Customer.find_customer(isim, password)
  if customer_found
    user_panel(Customer.find_customer(isim, password))
  else
    puts AUTH_ERROR
    return true
  end
end
