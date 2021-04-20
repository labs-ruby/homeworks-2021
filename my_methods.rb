module ArrayMethods
  refine Array do

    def my_each
      length.times do |i|
        yield(self[i])
      end
    end
  end
end
