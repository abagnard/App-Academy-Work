class Stack
  def initialize
    @stack = []
    # create ivar to store stack here!
  end

  def add(el)
    @stack << el
    el
    # adds an element to the stack
  end

  def remove
    @stack.pop
    # removes one element from the stack
  end

  def show
    @stack.dup
    # return a copy of the stack
  end
end


class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
    el
  end

  def dequeue(el)
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    @map.each do |el|
      if el.first == key
        el.last = value
      else
        @map << [key, value]
      end
    end
    [key, value]
  end

  def lookup(key)
    @map.each {|el| return el[1] if el[0] == key}
    nil
  end

  def remove(key)
    @map.map {|el| el.delete if el.first == key}
    nil
  end

  def show
    deep_dup(@map)
  end

private
  def deep_dup(arr)
    arr.map do |el|
      if el.is_a? (Array)
        deep_dup(el)
      else
        el
      end
    end
  end
end


  end

end
