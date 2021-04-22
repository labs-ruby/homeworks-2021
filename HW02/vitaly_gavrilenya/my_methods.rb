module NewArrayMethods
  refine Array do
    def my_map
      result_array = []
      for i in 0...self.length
        result_array << yield(self[i])
      end
      result_array
    end

    def my_select
      result_array = []
      for i in 0...self.length
        yield(self[i]) ? result_array << self[i] : result_array
      end
      result_array
    end

    def my_each
      for i in 0...self.length
        yield(self[i])
      end
      self
    end
  end
end

using NewArrayMethods

my_ary = [1, 2, 3, 4]

p my_ary.my_map{ |el| el + 1 }
p my_ary.my_select{ |el| el > 2 }
p my_ary.my_each{ |el| p el + 2 }
