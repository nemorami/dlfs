require "matrix"
# require "num"
# a = Tensor.new([2, 2]) { |i| i }
# print a.to_a # => [0, 1, 2, 3]
# a = Tensor.from_array [1, 2, 3]
# puts a.to_s

class Array(T)
  def <=>(t : T) : Array
    self.map { |e| e <=> t }
  end

  def to_m      
        Matrix.rows(self)    
  end 
  
end
