require 'json'
require_relative "MoneyData"

class Customer
  attr_accessor :isim, :password
  attr_reader :bakiye

  @customers = []

  def self.load_customers
    if File.exist?("customer_data.json")
      data = JSON.parse(File.read("customer_data.json"))

      # Load each customer from the file into the @customers array
      data.each do |isim, customer_data|
        password = customer_data.keys.first
        bakiye = customer_data[password]
        customer = Customer.new(isim, password, bakiye)
      end
    else
      # If the file doesn't exist, create it with default customer data
      default_customers = {
        "ihsan_aycan" => { "1234" => -10500 },
        "ali_dasbasi" => { "5678" => 1000 },
        "burak_yilmaz" => { "1122" => 200000 },
        "ahmet_yilmaz" => { "3344" => 0 },
        "tulin_ozen" => { "5566" => 1000 }
      }

      default_customers.each do |isim, customer_data|
        password = customer_data.keys.first
        bakiye = customer_data[password]
        customer = Customer.new(isim, password, bakiye)
      end

      # Save the default data to the file
      self.save_file("customer_data.json", @customers)
    end
  end

  def initialize(isim="", password="", bakiye = 0)
    @isim = isim
    @password = password
    @bakiye = bakiye
    @bank_object = MoneyData.new

    self.class.customers << self
    save_customer # Save the customer immediately after creation
  end

  def self.customers
    @customers
  end

  def to_h
    # Returning a hash where the key is `isim` and the value is another hash with `password` as the key and `bakiye` as the value
    {
      @isim => {
        @password => @bakiye
      }
    }
  end

  def save_customer
    self.class.save_file("customer_data.json", self.class.customers)
  end

  def deposit(transaction_bills, miktar)
    if @bank_object.update_bill_data(transaction_bills, "deposit")
      @bakiye += miktar
      puts "#{miktar}TL yatırdınız. Yeni bakiyeniz: #{@bakiye}\n"
      save_customer # Save the updated data after deposit
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
      save_customer # Save the updated data after withdrawal
    else
      puts "Yetersiz bakiye."
      puts "Bakiyeniz #{@bakiye}TL"
    end
  end

  private
def self.save_file(file_path, saved_data)
  # Read the existing data from the file if it exists
  existing_data = {}
  if File.exist?(file_path)
    existing_data = JSON.parse(File.read(file_path))
  end

  # Convert saved_data (Customer objects) to hash format
  customer_data = saved_data.map(&:to_h)

  # Merge the new customer data with the existing data
  merged_data = existing_data.merge(customer_data.reduce({}, :merge))

  # Write the merged data back to the file
  File.open(file_path, "w") do |file|
    file.write(JSON.generate(merged_data))
  end
end
end