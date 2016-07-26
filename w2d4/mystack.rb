class MyStack
  def initialize
    @store = []
  end

  def push(el)
    @store << el
  end

  def pop
<<<<<<< HEAD
    @store.pop
=======
    @store.pop
>>>>>>> 60ca954bdf35ba39f694ba445731b238523bda92
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
