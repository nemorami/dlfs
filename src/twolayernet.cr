require "matrix"
require "./dlfs"
class TwoLayerNet
    def initialize(input_size, hidden_size, output_size, weight_init_std = 0.01)
        @w1 = Matrix(Float64).new(input_size, hidden_size) {Random.rand}
        @b1 = Matrix(Float64).new(1, hidden_size, 0.0)
        @w2 = Matrix(Float64).new(hidden_size, output_size)
        @b2 = Matrix(Float64).new(1, output_size, 0.0)
    end

    def predict(x)
        a1 = x * @w1 + @b1
        z1 = sigmoid(a1)
        a2 = z1 * @w2 + @b2
        y = softmax(a2)        
    end

    def loss(x, t)
        cross_entropy_error(predict(x), t)
    end

    def accuracy(x, t)
        y = predict(x).
        
    end
end
net = TwoLayerNet.new(784, 100, 10)
x = Matrix.new(100,784) {Random.rand}
y = net.predict(x)
`
x = Matrix.new(2,3) {Random.rand}

