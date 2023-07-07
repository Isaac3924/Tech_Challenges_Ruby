# You are given three arrays of equal size. Each array has 1 million RANDOM integer values.
# Assume that each array is already sorted in ascending order and that no individual array has any duplicate values.
# Your goal is to write a method/function that will return an array of any/all values which are present in all three arrays.
# Bonus: Once you’ve found a working solution, try to optimize to run in O(n) time and 1x space complexity.

# I've already completed this challenge in Ruby on replit.com, so I'll type it out and owrk through the logic here.
# I'll see about recreating it in JavaScript as well.
# This function will take in three arguments. Meant to be arrays of integers.
def find_matches(nums_1, nums_2, nums_3)
  # Will create an empty array to store the matches in.
  matches = []
  # Will iterate through each element in the first array.
  nums_1.each do |num_1|
    # The next line will find the length of the digits of the current element in the first array.
    num_1_digits = num_1.digits.length

    # With that length, we can narrow down the second and third arrays to only include elements with the same number of
    # digits.
    nums_2_narrowed = nums_2.find_all { |num_2| num_2.digits.length == num_1_digits }
    nums_3_narrowed = nums_3.find_all { |num_3| num_3.digits.length == num_1_digits }

    # We check if the narrowed arrays include the current element from the first array. If they do, we add it to the
    # matches array.
    if nums_2_narrowed.include?(num_1) && nums_3_narrowed.include?(num_1)
      matches << num_1
    end
  end
  # We return the matches array once we've iterated through the first array.
  return matches
end
# The above function will work, but it is not very efficient. It will take a long time to run through all of the
# elements in the first array, and whiloe it might decrease the number of elements in the second and third arrays by looking
# through each for elements that are the same length as the current element in the first array, it will still take a long
# time to run through all of the elements in the second and third arrays. It's still extra steps.

# Next was my attempt at a more efficient solution. I think it's better. It's still not O(n) time, but it's better.
def find_matches_v2(nums_1, nums_2, nums_3)
  # Will create an empty array to store the matches in.
  matches = []
  # Will iterate through each element in the first array.
  nums_1.each do |num_1|
    # The next line will check if the second and third arrays include the current element from the first array. If they
    # do, we add it to the matches array.
    if nums_2.include?(num_1) && nums_3.include?(num_1)
      matches << num_1
    end
  end
  # We return the matches array once we've iterated through the first array.
  return matches
end
# Still not O(n) time, as I said, but it's better. I have one more method that I made. I think it's the best one.

def find_matches_v3(nums_1, nums_2, nums_3)
  # Like the previous methods, we will create an empty array to store the matches in, but we will also create three
  # pointers to keep track of where we are in each array.
  matches = []
  ptr1 = 0
  ptr2 = 0
  ptr3 = 0

  # We will have a while loop that will run as long as the pointers are less than the length of their respective arrays.
  while ptr1 < nums_1.length && ptr2 < nums_2.length && ptr3 < nums_3.length
    # We will create variables to store the current element in each array, the element that the pointer is currently
    # pointing to.
    num_1 = nums_1[ptr1]
    num_2 = nums_2[ptr2]
    num_3 = nums_3[ptr3]

    # We will check if the current element in the first array is equal to the current element in the second array and if
    # the current element in the second array is equal to the current element in the third array. If they are, we will
    # add the current element in the first array to the matches array and increment all three pointers.
    if num_1 == num_2 && num_2 == num_3
      matches << num_1
      ptr1 += 1
      ptr2 += 1
      ptr3 += 1
    # If the current element in the first array is less than the current element in the second array and the current
    # element in the first array is less than the current element in the third array, we will increment the first
    # pointer.
    elsif num_1 < num_2 && num_1 < num_3
      ptr1 += 1
    # If the current element in the second array is less than the current element in the first array and the current
    # element in the second array is less than the current element in the third array, we will increment the second
    # pointer.
    elsif num_2 < num_1 && num_2 < num_3
      ptr2 += 1
    else
      # If the above conditions are not met, then the only other possibility is that the current element in the third array
      # is less than the current element in the first array and the current element in the second array. In that case, we
      # will increment the third pointer.
      ptr3 += 1
    end
  end
  # We return the matches array once all pointers are equal to the length of their respective arrays, effectively having
  # iterated through all of the elements in each array.
  return matches
end
# This method is the best one. It's O(n) time and O(1) space. It's also the most efficient. It's the best one.

nums_1 = [1, 2, 4, 5, 8, 1592636]
nums_2 = [2, 3, 5, 7, 9, 1592636]
nums_3 = [1, 2, 5, 8, 9, 1592636]
p find_matches(nums_1, nums_2, nums_3) # Should return [2, 5, 1592636]
p find_matches_v2(nums_1, nums_2, nums_3) # Should return [2, 5, 1592636]
p find_matches_v3(nums_1, nums_2, nums_3) # Should return [2, 5, 1592636]