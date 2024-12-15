require 'json'
require_relative "MoneyData"
require_relative "CustomerLoader"

class Customer
  attr_accessor :isim, :password
  attr_reader :bakiye

  @customers = []

  def self.customers
    @customers
  end

  def initialize(isim = "", password = "", bakiye = 0)
    @isim = isim
    @password = password
    @bakiye = bakiye
    @bank_object = MoneyData.new
    self.class.customers << self
    save_customer
  end

  def to_h
    { @isim => { @password => @bakiye } }
  end

  def save_customer
    CustomerLoader.save_customers_to_file("customer_data.json", self.class.customers)
  end

  def deposit(transaction_bills, miktar)
    if @bank_object.update_bill_data(transaction_bills, "deposit")
      @bakiye += miktar
      puts "#{miktar}TL yatırdınız. Yeni bakiyeniz: #{@bakiye}\n"
      save_customer
    end
  end

  def self.find_customer(isim, password)
    @customers.find { |customer| customer.isim == isim && customer.password == password }
  end

  def withdraw(miktar)
    withdrawn_bills = @bank_object.amount_to_bills(miktar)
    withdrawn_bills.each { |key, value| puts "#{key} TL: #{value} adet" }

    if @bakiye >= miktar && @bank_object.update_bill_data(withdrawn_bills, "withdraw")
      puts "Toplam #{miktar}TL çektiniz:"
      withdrawn_bills.each { |key, value| puts "#{key} TL: #{value} adet" if value > 0 }
      @bakiye -= miktar
      puts "Yeni bakiyeniz #{@bakiye}TL\n"
      save_customer
    else
      puts "Yetersiz bakiye."
      puts "Bakiyeniz #{@bakiye}TL"
    end
  end
end

