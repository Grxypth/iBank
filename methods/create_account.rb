def create_account  
  puts "İsim ve soyisminizi giriniz"
  isim = gets.chomp.downcase
  puts "Şifrenizi giriniz"
  password = gets.chomp.downcase
  new_customer = Customer.new(isim, password)
end
