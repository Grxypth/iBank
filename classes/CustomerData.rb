class Customer
  attr_accessor :isim,:password

  def initialize(isim, password, bakiye = 0)
    @isim = isim
    @password = password
    @bakiye = bakiye
  end

  def deposit(miktar)
    @bakiye += miktar
    puts "#{miktar}TL yatırdınız. Yeni bakiyeniz: #{@bakiye}"
  end

  def withdraw(miktar)
    if @bakiye >= miktar
      @bakiye -= miktar
      puts "#{miktar}TL çektiniz . Yeni bakiyeniz #{@bakiye}"
    else
      puts "Yetersiz bakiye."
    end
  end
end

