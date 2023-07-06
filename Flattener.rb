# Make a method/function that takes an input of a multi-dimensional array and output a one-dimensional array. More simply
#  put, remove the deeply nested brackets to return a single array.

def flatten_ing(array, flattened_array = [])
  # First, we will make a variable to be an empoty array. This will be the array that we return.
  # Next, we will iterate through each element in an array.
  array.each do |element|
    # If the element is an array, we will recursively call the method on that element with the flattened_array as a new 
    # second argument that will be passed in so that we can add the elements to the flattened_array.
    if element.is_a?(Array)
      flatten_ing(element, flattened_array)
    # Otherwise, we will add the element to the flattened_array.
    else
      flattened_array << element
    end
  end
  # Once we've iterated through the entire array, we will return the flattened_array.
  return flattened_array
end

p flatten_ing([1, 2, 3, [4, 5]]) # => [1, 2, 3, 4, 5]
p flatten_ing([1, 2, 3, [[4], 5], [[[6]]]]) # => [1, 2, 3, 4, 5, 6]