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



def save_file(file_path, section_name, saved_data)
  if File.exist?(file_path)
    # Read existing data from file
    data = JSON.parse(File.read(file_path))
    # Ensure section_name is a symbol to avoid string issues
    data[section_name.to_sym] = saved_data
  else
    # If file doesn't exist, create it with the correct structure
    data = { section_name.to_sym => saved_data }
  end
  
  # Write the updated data back to the file
  File.open(file_path, "w") do |file|
    file.write(JSON.generate(data))
  end
end