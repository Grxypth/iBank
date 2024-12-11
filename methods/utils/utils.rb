def validate_number(input)
  while true
    if input.chars.all? { |char| char =~ /[0-9]/ }
      return input
    else
      puts "Lütfen sadece sayı kullanarak tekrar deneyin! \n"
      input = gets.chomp
    end
  end
end

def validate_letter(input)
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

def valid_password(input)
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



def save_file(file_path,section_name,saved_data)
  if File.exist?(file_path)
    data = JSON.parse(File.read(FILE_PATH))
    data.merge!(section_name => saved_data)
  else
    data = { section_name => saved_data }
  end
  
  File.open(FILE_PATH, "w") do |file|
    file.write(JSON.generate(data))
  end
end