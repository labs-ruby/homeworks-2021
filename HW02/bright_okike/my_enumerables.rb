# frozen_string_literal: true

# my enumerables module
module MyEnumerables
  def my_each
    length.times do |x|
      yield(self[x])
    end
  end

  def my_map(proc = nil)
    arr = []
    if proc
      length.times do |x|
        arr.push(proc.call(self[x]))
      end
    else
      length.times do |x|
        arr.push(yield(self[x]))
      end
    end
    arr
  end

  def my_select
    arr = []
    length.times do |x|
      arr.push(self[x]) if yield(self[x])
    end
    arr
  end

  def my_all?
    length.times do |x|
      !yield(self[x]) ? false : true
    end
  end

  def my_any?
    length.times do |x|
      return true if yield(self[x]) != false
    end
    false
  end

  def my_none?
    length.times do |x|
      return false if yield(self[x])
    end
    true
  end

  def my_count(arg = nil, &block)
    arr = []
    if block_given?
      arr = my_select(&block)
    elsif !arg.nil?
      arr = my_select { |x| x == arg }
    else
      return size
    end
    arr.length
  end

  def my_inject(args = 0)
    my_each do |el|
      args = yield(args, el)
    end
    args
  end
end
