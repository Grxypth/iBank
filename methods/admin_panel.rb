## eğer bu paneli kullanmaya devam etmek istiyorsanız bu method false döndürmeli, eğer bir önceki menüye dönmek istiyorsanız true döndürmelidir.
def admin_panel
  admin_username = "admin"
  admin_password = "admin"
  is_admin = false

  print "Kullanıcı adı: "
  username = gets.chomp
  print "Şifre: "
  password = gets.chomp

  if username == admin_username && password == admin_password
    puts "Admin paneline hoş geldiniz!"
    is_admin = true
  else
    puts "Kullanıcı adı veya şifre hatalı!"
    return true
  end
end
