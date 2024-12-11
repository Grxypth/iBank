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
