class MoneyData
  @@bills = {
    "200": 500,
    "100": 500,
    "50": 500,
    "20": 500,
    "10": 500,
    "5": 500
  }
  MAX_BILL = 600
  @@total = 0
  def self.calculate_bills(bills)
    total = 0
    bills.each do |key, value|
      bill_data = key.to_s.to_i
      total += bill_data * value
      @@total = total
    end
    total
  end
  def update_bill_data(transaction_bills, type)
    banka_fakir =
      MoneyData.calculate_bills(transaction_bills) >
        MoneyData.calculate_bills(@@bills)
    if (type == "withdraw" && banka_fakir)
      puts "Banka kasasında yeterli bakiye yok."
      return false
    end

    if type == "deposit"
      @@bills.each do |key, value|
        new_count = value + transaction_bills[key]
        if new_count > MAX_BILL
          puts "Banka kasasında banknotlarınızı alacak kadar yer yok."
          return false
        end
      end
    end

    @@bills.each do |key, value|
      if type == "deposit"
        @@bills[key] += transaction_bills[key]
      else
        @@bills[key] -= transaction_bills[key]
      end
    end

    @@bills.each { |key, value| puts "#{key} TL: #{value} adet" if value > 0 }
    puts "Banka kasasında #{MoneyData.calculate_bills(@@bills)}TL var"
    return true
  end
end
