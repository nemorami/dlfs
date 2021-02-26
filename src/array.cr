require "matrix"
require "num"
a = Tensor.new([2, 2]) { |i| i }
print a.to_a # => [0, 1, 2, 3]
a = Tensor.from_array [1, 2, 3]
puts a.to_s
# class Array(T)
#   def <=>(t : T) : Array
#     self.map { |e| e <=> t }
#   end

# #   def to_m
# #     if(self[0].is_a? Array)
        
# #         #puts Matrix.rows(self)
# #         puts self
# #         a = self[0]
# #         puts a.to_a
        
# #     else
# #         Matrix.rows([self])
# #     end
# #   end
# end
