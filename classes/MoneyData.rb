require "json"
require_relative "../methods/utils/utils"
class MoneyData
  def initialize
    @bills = load_bills
    @total = calculate_bills(load_bills)
    @MAX_BILL = 600
  end

  def load_bills
    if File.exist?("bills_data.json")
      data = JSON.parse(File.read("bills_data.json"))
      data = data.transform_keys(&:to_sym)
      return data
    else
      { "200": 500, "100": 500, "50": 500, "20": 500, "10": 500, "5": 500 }
    end
  end

  def save_bills
    if File.exist?("bills_data.json")
      data = JSON.parse(File.read("bills_data.json"))
    else
      data = {}
    end
    File.open("bills_data.json", "w") do |file|
      file.write(JSON.generate(@bills))
    end
  end

  def calculate_bills(bills) ##banknotlardan toplam para miktarını hesaplayan method
    total = 0
    bills.each do |key, value|
      bill_data = key.to_s.to_i
      total += bill_data * value
    end
    total
  end

  def amount_to_bills(miktar) ##yatırılan para miktarını banknotlara çeviren method
    transaction_bills = {
      "200": 0,
      "100": 0,
      "50": 0,
      "20": 0,
      "10": 0,
      "5": 0
    }
    transaction_bills.each do |key, value|
      bill_data = key.to_s.to_i
      if miktar >= bill_data
        bill_count = miktar / bill_data
        transaction_bills[key] = bill_count
        miktar -= bill_data * bill_count
      end
    end
    return transaction_bills
  end

  def update_bill_data(transaction_bills, type) ##bankada mevcut bulunan banknotları güncellemek için kullanılan method
    banka_fakir = calculate_bills(transaction_bills) > calculate_bills(@bills)
    if type == "withdraw" && banka_fakir
      puts "Banka kasasında yeterli bakiye yok."
      return false
    end

    if type == "deposit"
      @bills.each do |key, value|
        new_count = value + transaction_bills[key]
        if new_count > @MAX_BILL
          puts "Banka kasasında banknotlarınızı alacak kadar yer yok."
          return false
        end
      end
    end
    @bills.each do |key, value|
      if type == "deposit"
        @bills[key] += transaction_bills[key]
      else
        @bills[key] -= transaction_bills[key]
      end
    end

    save_bills
    ##@bills.each { |key, value| puts "#{key} TL: #{value} adet" if value > 0 }
    ##puts "Banka kasasında #{calculate_bills(@bills)}TL var"
    return true
  end
end
