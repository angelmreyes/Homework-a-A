class Map
  def initialize
    @map = []
  end
  
  def set(key, value)
    return @map << [key, value] if @map.empty?
    contains = false
    @map.each do |pair|
      if pair[0] == key
        pair[1] = value
        contains = true
        return pair
      end
    end
    if !contains
      return @map << [key, value]
    end
  end 
  
  def get(key)
    @map.each do |pair|
      if pair[0] == key
        return pair
      end
    end
  end 
  
  def delete(key)
    @map.each_with_index do |pair, i|
      if pair[0] == key
        @map.delete_at(i)
      end
    end
  end 
  
  def show
    @map
  end
end

map = Map.new
p map #[]
p map.set(2, 3) #[[2, 3]]
p map.set(4, 5) #[[2, 3], [4, 5]]
p map.set("a", :a) #[[2, 3], [4, 5], ["a", :a]]
p map #[[2, 3], [4, 5], ["a", :a]]
p map.set(2, 3) #[2, 3]
p map.set(2, 4) #[2, 4]
p map.delete(2) #[[4, 5], ["a", :a]]
p map.delete(6) #[[4, 5], ["a", :a]]
p map.get(4) #[4, 5]
p map.get(2) #[[4, 5], ["a", :a]]
p map.show #[[4, 5], ["a", :a]]
