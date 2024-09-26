#1. Matching a specific pattern:
str = "Hello, world!"
pattern = /World/
if str =~ pattern
  puts "Match found"
else
  puts "No match"
end

#2. Matching multiple patterns using alternation:
str = "I love cats, dogs, and rabbits"
pattern = /cats|dogs|rabbits/
if str =~ pattern
  puts "Match found"
else
  puts "No match"
end

#3. Matching a pattern with a quantifier:
str = "aaaaaaabbbbbb"
pattern = /a{8}b{6}/
if str =~ pattern
  puts "Match found"
else
  puts "No match"
end

#4. Matching a pattern with a wildcard character:
str = "Hello, world!"
pattern = /He..o/
if str =~ pattern
  puts "Match found"
else
  puts "No match"
end

#5. Matching a pattern with a character class:
str = "I have 3 cats and 2 dogs"
pattern = /\d+/
if str =~ pattern
  puts "Match found"
else
  puts "No match"
end

#6. A named group returns a MatchData object which you can access to read the results
m = "David 30".match /(?<name>\w+) (?<age>\d+)/
puts "Age: " + m[:age]
puts "Name: " + m[:name]

#7. check if string contain any of these string elements
def contains_vowel(str)
    str =~ /[aeiou]/
end
  
contains_vowel("test") 
contains_vowel("sky") 

#8. check if string contain any of these int elements
def contains_number(str)
    str =~ /[0-9]/
end
  
puts contains_number("The year is 2015")  # returns 12
puts contains_number("The cat is black")  # returns nil

#9. case insensitive
puts "abc".match?(/[A-Z]/i)
