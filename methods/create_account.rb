def create_account
puts "İsim ve soyisminizi giriniz"
isim=gets.chomp
puts "Şifrenizi giriniz"
password=gets.chomp
new_customer = Customer.new(isim, password)
end