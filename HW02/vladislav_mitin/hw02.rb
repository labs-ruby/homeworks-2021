module MyEnumerableMethods
  refine Array do
    def my_each
      if block_given?
        0.upto(length - 1) { |i| yield self[i] }

        self
      else
        to_enum :my_each
      end
    end

    def my_map
      res = []

      if block_given?
        0.upto(length - 1) { |i| res << yield(self[i]) }
      else
        res = to_enum :my_map
      end

      res
    end

    def my_select
      res = []

      if block_given?
        0.upto(length - 1) { |i| res << self[i] if yield(self[i]) }
      else
        res = to_enum :my_select
      end

      res
    end
  end
end
