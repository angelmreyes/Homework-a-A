class Stack
  def initialize
    # create ivar to store stack here!
    @ivar = []
  end

  def push(el)
    # adds an element to the stack
    @ivar << el
  end

  def pop
    # removes one element from the stack
    @ivar.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @ivar.last
  end
end

stack = Stack.new
stack.push(1)
stack.push(2)
p stack.push(3) #[1, 2, 3]
p stack.peek #3
stack.pop
p stack.peek #2