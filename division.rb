def get_integer(prompt)
  
    print prompt
    Integer(gets.chomp)
end

begin
  numerator = get_integer("Enter a numerator: ")
  denominator = get_integer("Enter a denominator: ")
  puts "Your result is #{numerator/denominator}."
rescue ArgumentError => ex
  puts "Your input was invalid: #{ex.message}"
rescue ZeroDivisionError => ex
  puts "You cannot divide by zero!"
end
