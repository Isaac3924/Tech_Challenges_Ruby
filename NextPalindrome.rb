# A palindrome is any number, word, or phrase that reads the same forward as it does backward. In this challenge, 
# we are going to focus on palindromic numbers. For example, 12321 is a palindromic number, whereas 123 is not.

# Your goal is to write a method/function that takes in an integer and returns the next palindrome. It is safe 
# to assume you are working with only whole numbers, no decimals, and no negatives.

# The method/function will take in one argument, an integer. It will return an integer.
def find_next_palindrome(num)
  # We will iterate through the numbers starting with the next number after the given number.
  next_num = num + 1

  # We will check if the next number is a palindrome. If it is, we will return it, ending the function.
  if next_num.to_s == next_num.to_s.reverse
    return next_num
  end

  # If the next number is not a palindrome, we will call the function again, recursively passing in the next number as 
  # the argument.
  find_next_palindrome(next_num)
end

p find_next_palindrome(12321) # => 12421
p find_next_palindrome(123) # => 131
p find_next_palindrome(101) # => 111