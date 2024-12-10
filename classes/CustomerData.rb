require_relative "MoneyData"
class Customer
  attr_accessor :isim, :password
  attr_reader :bakiye

  @@customers = []
  @@vault_data = MoneyData.new

  def initialize(isim, password, bakiye = 0)
    @isim = isim
    @password = password
    @bakiye = bakiye
    @@customers << self
  end

  def deposit(transaction_bills,miktar)
    bills = { "200": 0, "100": 0, "50": 0, "20": 0, "10": 0, "5": 0 }
    bills.each do |key, value|
    bills[key]+=transaction_bills[key]
    end
    @bakiye += miktar
    @@vault_data.update_bill_data(bills,"deposit")
    puts "#{miktar}TL yatırdınız. Yeni bakiyeniz: #{@bakiye}\n"
  end
  
  def self.all_customers
    @@customers
  end
  def self.find_customer(isim, password)
    @@customers.find do |customer|
      customer.isim == isim && customer.password == password
    end
  end
  def withdraw(miktar)
    if @bakiye >= miktar
      original_amount = miktar
      bills = { "200": 0, "100": 0, "50": 0, "20": 0, "10": 0, "5": 0 }

      bills.each do |key, value|
        bill_data = key.to_s.to_i
        if miktar >= bill_data
          bill_count = miktar / bill_data
          bills[key] = bill_count
          miktar -= bill_data * bill_count
        end
      end
      @bakiye -= (original_amount - miktar)
      puts "\nToplam #{original_amount}TL çektiniz:"
      bills.each { |key, value| puts "#{key} TL: #{value} adet" if value > 0 }
      puts "Yeni bakiyeniz #{@bakiye}TL\n"
      @@vault_data.update_bill_data(bills,"withdraw")
    else
      puts "Yetersiz bakiye."
      puts "Bakiyeniz #{@bakiye}TL"
    end
  end
end
