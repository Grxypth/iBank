def create_account
  puts "İsim ve soyisminizi giriniz"
  isim = validate_letter(gets.chomp.downcase)
  puts "Şifrenizi giriniz"
  password = valid_password(gets.chomp)
  new_customer = Customer.new(isim, password)
end
