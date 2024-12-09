class Customer
  attr_accessor :isim, :password
  attr_reader :bakiye

  @@customers = []

  def initialize(isim, password, bakiye = 0)
    @isim = isim
    @password = password
    @bakiye = bakiye
    @@customers << self
  end

  def deposit(miktar)
    @bakiye += miktar
    puts "#{miktar}TL yatırdınız. Yeni bakiyeniz: #{@bakiye}"
  end
  def self.all_customers
  @@customers
  end
  def self.find_customer(isim,password)
    @@customers.find { |customer| customer.isim == isim && customer.password==password}
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
