# frozen_string_literal: true

module ArrayMethods
  refine Array do
    def my_map
      return unless block_given?

      new_arr = []
      (0...length).each do |i|
        new_arr << yield(self[i])
      end
      new_arr
    end

    def my_select
      return unless block_given?

      new_arr = []
      (0...length).each do |i|
        new_arr << self[i] if yield(self[i])
      end
      new_arr
    end

    def my_each
      return unless block_given?

      (0...length).each do |i|
        yield(self[i])
      end
      self
    end
  end
end
