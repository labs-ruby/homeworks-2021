module NewArrayMethods
  refine Array do
    def my_each
      size.times { |i| yield(self[i]) }
      self
    end

    def my_map
      new_arr = []
      new_arr << size.times { |i| yield(self[i]) }
      new_arr
    end

    def my_select
      new_arr = []
      size.times do |i|
        new_arr << self[i] if yield(self[i])
      end
      new_arr
    end
  end
end

using NewArrayMethods

arr = [1, 2, 3, 4, 5, 6, 7, 8]

arr.my_each { |x| print x }
arr.my_map { |x| print x + 1 }
arr.my_select { |x| print x.even? }
