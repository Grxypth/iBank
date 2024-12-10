class MoneyData
  @@bills = {
    "200": 500,
    "100": 500,
    "50": 500,
    "20": 500,
    "10": 500,
    "5": 500
  }
  MAX_BILL=600
  @@total=0
  def self.bank_vault
    total = 0
    @@bills.each do |key,value|
    bill_data= key.to_s.to_i
    total+=bill_data*value  
    @@total=total
    end

    puts "Banka kasasında toplam #{total}TL var."
  end

  def update_bill_data(transaction_bills,type)
    @@bills.each do |key,value|
      if type=="deposit"
      @@bills[key]+=transaction_bills[key]
    else
      @@bills[key]-=transaction_bills[key]
    end
end
@@bills.each { |key, value| puts "#{key} TL: #{value} adet" if value > 0 }
MoneyData.bank_vault
end

end