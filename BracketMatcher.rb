# Create a method/function that will intake a set of brackets [ { ( as a string and determine if the brackets are 
# well-formed (match). Brackets can be nested.

def bracket(string)
  # First will check if the string is odd, starts with an impossible bracket, or ends with an impossible bracket,
  #  if it does any of this then it is not well-formed. This assumes that only brackets will be passed in.
  if string.length.odd? || string[0] == ")" || string[0] == "]" || string[0] == "}" || string[-1] == "(" || 
    string[-1] == "[" || string[-1] == "{"
    return false
  # Next will check number of each possible bracket, if it is not equal to the number of opposite bracket then it is 
  # not well-formed
  elsif string.count("(") != string.count(")") && string.count("[") != string.count("]") && 
    string.count("{") != string.count("}")
    return false
  # If it passes all of the above we can further test to see if it is well-formed
  else
    # # I think I'll need to recursively call logic in the else statement to check for nested brackets... IF one of the   
    # # arrays is even. If it is odd then it will return true... part of me thinks that there will
    # # still be a problem with this logic... but I'm unsure.
    # # First we will create an array of the string
    # array = string.split("")
    # # Next we will split the array into two arrays in the middle. If they are the same then it is well-formed.
    # array1 = array[0..(array.count/2)-1]
    # array2 = array[(array.count/2)..-1]
    # if array1 == array2
    #   # I'm still not sure if this is the best option, but I think it's sufficient for now.
    #   return true
    # end
    stack = []
    brackets = { ")" => "(", "]" => "[", "}" => "{" }

    string.each_char do |char|
      if brackets.values.include?(char)
        stack << char
      elsif brackets.keys.include?(char)
        return false if stack.empty? || stack.pop != brackets[char]
      end
    end

    return stack.empty?
  end
end

print bracket("()[]{}") # => true
print bracket("([)]") # => false
print bracket("((()") # => false
print bracket("((()))") # => true