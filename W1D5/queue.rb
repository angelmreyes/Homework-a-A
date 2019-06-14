class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end
end

queue = Queue.new
p queue.enqueue(1) #[1]
queue.enqueue(2)
p queue.peek #1
queue.dequeue
queue.enqueue(3)
queue.enqueue(4)
p queue.enqueue(5) #[2, 3, 4, 5]
p queue.peek #2


