module MyArrayMethods

  refine Array do
     def my_each
	  for i in 0..self.size-1
	    yield self[i]
	  end
    end

    def my_select
    end

    def my_map	
    end
  end

end
