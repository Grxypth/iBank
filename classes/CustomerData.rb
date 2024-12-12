require_relative "MoneyData"
class Customer
  attr_accessor :isim, :password
  attr_reader :bakiye
  
  BANK_FILE_PATH = "bills_data.json"
  @@customers = []

  def initialize(isim, password, bakiye = 0)
    @isim = isim
    @password = password
    @bakiye = bakiye
    @@customers << self
    @bank_object=MoneyData.new
    # @bills = load_bills
  end

  # def self.load_bills
  #   if File.exist?(FILE_PATH)
  #     data = JSON.parse(File.read(FILE_PATH))
  #     data["bills"] || { "200": 0, "100": 0, "50": 0, "20": 0, "10": 0, "5": 0 }
  #   else
  #     { "200": 0, "100": 0, "50": 0, "20": 0, "10": 0, "5": 0 }
  #   end
  # end
 
def deposit(transaction_bills, miktar) 
    if @bank_object.update_bill_data(transaction_bills, "deposit") == true
      @bakiye += miktar
      puts "#{miktar}TL yatırdınız. Yeni bakiyeniz: #{@bakiye}\n"
    end
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
    withdrawn_bills=@bank_object.amount_to_bills(miktar)
    withdrawn_bills.each do |key, value|
      puts "#{key} TL: #{value} adet"
    end
    ##alttaki if statementa girmiyor
    if @bakiye >= miktar &&  @bank_object.update_bill_data(withdrawn_bills, "withdraw") == true
       puts "i work"
      original_amount = miktar
        @bakiye -= miktar
        puts "\nToplam #{original_amount}TL çektiniz:"
        withdrawn_bills.each { |key, value| puts "#{key} TL: #{value} adet" if value > 0 }
        puts "Yeni bakiyeniz #{@bakiye}TL\n"
    else
      puts "Yetersiz bakiye."
      puts "Bakiyeniz #{@bakiye}TL"
    end
  end
end
