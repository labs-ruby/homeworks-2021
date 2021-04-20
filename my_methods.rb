module ArrayMethods
  refine Array do

    def my_each
      length.times do |i|
        yield(self[i])
      end
    end
    
    def my_map
      return_array = []
      length.times do |i|
        return_array[i] = yield(self[i])
      end
      return_array
    end
    
    def my_empty?
      true if length.zero?
      false if length != 0
    end
  end
end
