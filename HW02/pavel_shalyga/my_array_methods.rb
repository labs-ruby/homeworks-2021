# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_each
      (0...length).each do |index|
        yield(self[index]) if block_given?
      end
      self
    end

    def my_select
      if block_given?
        array = []
        (0...length).each do |index|
          array << self[index] if yield(self[index])
        end
        array
      else
        self
      end
    end

    def my_map
      if block_given?
        array = []
        (0...length).each do |index|
          array << yield(self[index])
        end
        array
      else
        self
      end
    end
  end
end
