module MyArrayMethods
  refine Array do
    def my_each
      for index in (0...length)
        yield(self[index]) if block_given?
      end
      self
    end
  end
end



