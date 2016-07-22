require_relative "mystack"

class StackQueue
  # def initialize
  #   @store = Stack.new.store
  # end
  def initialize()
    @stack1 = MyStack.new()
    @stack2 = MyStack.new()
  end

  def enqueque(el)
    until @stack2.empty?
      @stack1.push(@stack2.pop)
    end
    @stack1.push(el)
  end

  def dequeue
    until @stack1.empty?
      @stack2.push(@stack1.pop)
    end
    @stack2.pop
  end

  def size
    @stack1.size + @stack2.size 
  end

  def empty?
    @stack1.empty? && @stack2.empty?
  end

end
