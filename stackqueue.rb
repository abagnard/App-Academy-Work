require_relative "mystack"

def StackQueue
  def initialize
    @store = Stack.new.store
  end

  def enqueque(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end
