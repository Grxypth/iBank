class CustomerLoader
  def self.load_customers(file_path = "customer_data.json")
    if File.exist?(file_path)
      data = JSON.parse(File.read(file_path))

      data.each do |isim, customer_data|
        password = customer_data.keys.first
        bakiye = customer_data[password]
        Customer.new(isim, password, bakiye)
      end
    else
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
        Customer.new(isim, password, bakiye)
      end

      save_customers_to_file(file_path, Customer.customers)
    end
  end


  def self.save_customers_to_file(file_path, customers)
    customer_data = customers.map(&:to_h)
    File.open(file_path, "w") do |file|
      file.write(JSON.generate(customer_data.reduce({}, :merge)))
    end
  end
end
