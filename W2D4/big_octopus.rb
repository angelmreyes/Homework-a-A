#### Big O-ctopus and Biggest Fish
#A Very Hungry Octopus wants to eat the longest fish in an array of fish.

fish = [
  'fish', 
  'fiiish', 
  'fiiiiish', 
  'fiiiish', 
  'fffish', 
  'ffiiiiisshh', 
  'fsh', 
  'fiiiissshhhhhh'
] 

### Sluggish Octopus
#Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
def longest_fish(fish)
  longest = fish[0]
  fish.each_with_index do |ele1, i|
    fish.each_with_index do |ele2, j|
      if j > i && ((longest.length <=> ele2.length) == -1)
        longest = ele2
      end 
    end
  end
  longest
end

puts
puts "longest_fish: "
p longest_fish(fish) #=> "fiiiissshhhhhh"

### Dominant Octopus
# Find the longest fish in O(n log n) time.
# Hint: You saw a sorting algorithm that runs in O(n log n) 
# in the Sorting Complexity Demo.
# Remember that Big O is classified by the dominant term.
def dominant_fish_sort(fish)
  return fish if fish.length < 2
  pivot = fish.first
  left = fish.select { |ele| ele.length < pivot.length }
  right = fish.select { |ele| ele.length > pivot.length }
  dominant_fish_sort(left) + [pivot] + dominant_fish_sort(right)
end

puts
puts "dominant_fish: " #how can I return the largest element from within the quick_sort method?
p dominant_fish_sort(fish).last #=> "fiiiissshhhhhh"

### Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest 
# fish that you have found so far while stepping through the array only once.
def clever_fish(fish)
  longest = ""
  
  fish.each do |ele|
    if longest.length < ele.length
      longest = ele
    end
  end

  longest
end

puts
puts "clever_fish: "
p clever_fish(fish) #=> "fiiiissshhhhhh"

## Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution.
# The game has tiles in the following directions:

tiles_array = [
  "up", 
  "right-up", 
  "right", 
  "right-down", 
  "down", 
  "left-down", 
  "left",  
  "left-up" 
]

# To play the game, the octopus must step on a tile with her corresponding tentacle.
# We can assume that the octopus's eight tentacles are numbered and correspond 
# to the tile direction indices.

### Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number 
# (tile index) the octopus must move. This should take O(n) time.
def slow_dance(str, tiles_array)
  tiles_array.each_with_index do |ele, i|
    if str == ele
      return i
    end
  end
end

puts
puts "slow_dance: "
p slow_dance("up", tiles_array) #=> 0
p slow_dance("right-down", tiles_array) #=> 3

### Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster.
# Use a different data structure and write a new function so that 
# you can access the tentacle number in O(1) time.
new_tiles_data_structure = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(str, new_tiles_data_structure)
  new_tiles_data_structure[str]
end

puts
puts "fast_dance: "
p fast_dance("up", new_tiles_data_structure) #=> 0
p fast_dance("right-down", new_tiles_data_structure) #=> 3