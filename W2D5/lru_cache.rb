 class LRUCache
    def initialize(size)
      @cache = []
      @size = size
    end

    def count
      # returns number of elements currently in cache
      cache.count
    end

    def add(el)
      #use % to choose with fixed space to place elements
      # adds element to cache according to LRU principle
      if self.count == size
        if cache.include?(el)
          cache.delete(el)
          cache.unshift(el)
        else
          cache.pop
          cache.unshift(el)
        end
      elsif self.count < size
        if cache.include?(el)
          cache.delete(el)
          cache.unshift(el)
        else
          cache.unshift(el)
        end
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      cache.reverse
    end

    private
    # helper methods go here!
    attr_reader :cache, :size

  end

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  p johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  p johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]