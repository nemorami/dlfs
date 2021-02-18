require "matrix"
class SimpleNet
    def initialize
        #@W = Array.new(2,Array.new(3,Random.rand))
        @W = Matrix(Float64).new(2,3){Random.rand}
    end

    def predict(x : Matrix)
        x * @W
    end

    def loss(x : Matrix, t : Matrix)
        cross_entropy_error(softmax(predict(x)), t)
    end
end