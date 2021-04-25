# frozen_string_literal: true

module NewArrayMethods
  refine Array do
    def my_map
      result_array = []
      (0...length).each do |i|
        result_array << yield(self[i])
      end
      result_array
    end

    def my_select
      result_array = []
      (0...length).each do |i|
        result_array << self[i] if yield(self[i])
      end
      result_array
    end

    def my_each
      (0...length).each do |i|
        yield(self[i])
      end
      self
    end
  end
end

using NewArrayMethods

my_ary = [1, 2, 3, 4]

p my_ary.my_map { |el| el + 1 }
p my_ary.my_select { |el| el > 2 }
p my_ary.my_each { |el| p el + 2 }
