def create_account ## hesap oluşturmak için kullanılan method
  puts "İsim ve soyisminizi giriniz"
  isim = validate_letter(gets.chomp.downcase)
  puts "Şifrenizi giriniz"
  password = valid_password(gets.chomp)
  if Customer.find_customer(isim, password)
    puts "Bu isimde bir hesap zaten var"
    return true
  else
    new_customer = Customer.new(isim, password)
  end
end
