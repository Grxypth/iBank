class CustomerLoader
  def self.load_customers(file_path = "customer_data.json") ## dosyadan mevcut müşterileri yüklemek için kullanılan method
    if File.exist?(file_path)
      data = JSON.parse(File.read(file_path))

      data.each do |isim, customer_data|
        password = customer_data.keys.first
        bakiye = customer_data[password]
        daily_limit = customer_data["daily_limit"]
        Customer.new(isim, password, bakiye, daily_limit)
      end
    else
      default_customers = {
        "ihsan aycan" => {
          "1234" => -10_500,
          "daily_limit" => 10_000
        },
        "ali daşbaşı" => {
          "5678" => 1000,
          "daily_limit" => 10_000
        },
        "burak yılmaz" => {
          "1122" => 200_000,
          "daily_limit" => 10_000
        },
        "ahmet yılmaz" => {
          "3344" => 0,
          "daily_limit" => 10_000
        },
        "tülin özen" => {
          "5566" => 1000,
          "daily_limit" => 10_000
        }
      }

      default_customers.each do |isim, customer_data|
        password = customer_data.keys.first
        bakiye = customer_data[password]
        daily_limit = customer_data["daily_limit"]
        Customer.new(isim, password, bakiye, daily_limit)
      end

      save_customers_to_file(file_path, Customer.customers)
    end
  end

  def self.save_customers_to_file(file_path, customers) ##mevcut müşterileri dosyaya kaydetmek için kullanılan method
    customer_data = customers.map(&:to_h)
    File.open(file_path, "w") do |file|
      file.write(JSON.generate(customer_data.reduce({}, :merge)))
    end
  end
end
