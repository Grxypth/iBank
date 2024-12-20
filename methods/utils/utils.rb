def validate_number(input) #sadece sayı kullanarak input almak için kullanılan method
  while true
    if input.chars.all? { |char| char =~ /[0-9]/ }
      return input
    else
      puts "Lütfen sadece sayı kullanarak tekrar deneyin! \n"
      input = gets.chomp
    end
  end
end

def validate_letter(input) #sadece harf kullanarak input almak için kullanılan method
  valid_characters = "abcçdefgğhıijklmnoöprsştuüvyz ".chars
  while true
    if input.downcase.chars.all? { |char| valid_characters.include?(char) }
      return input
    else
      puts "Lütfen sadece harf kullanarak tekrar deneyin\n"
      input = gets.chomp
    end
  end
end

def valid_password(input) #şifre oluşturmak için kullanılan method
  while true
    if input.to_s.length == 4
      validate_number(input)
      return input
    else
      puts "Şifreler sadece 4 haneli olabilir, düzelterek tekrar deneyin"
      input = gets.chomp
    end
  end
end

def save_file(file_path, saved_data) #dosyaya veri kaydetmek için kullanılan method
  if File.exist?(file_path)
    data = JSON.parse(File.read(file_path))
  else
    data = {}
  end

  data = saved_data

  File.open(file_path, "w") { |file| file.write(JSON.generate(data)) }
end
