require "num"

require "matrix"

# TODO: Write documentation for `Dlfs`
module Dlfs
  VERSION = "0.1.0"

  # TODO: Put your code here
end

class Array(T)
  def <=>(t : T) : Array
    self.map { |e| e <=> t }
  end  
end

def step_function(x)
  x <=> 0
end

def smap(x, &)
  yield x
end

def smap(x : Iterable, & ) 
  x.map { |e| yield e }
end

# 블록으로 주어진 함수의 x에서 미분값을 구한다.
#
#
def numerical_diff(x, &)
  h = 0.0001
  smap(x) do |x|
    (yield(x+h) - yield(x-h)) / (2*h)  
  end  
end

# 
#
# TODO: generic. to make The first argument 
def numerical_gradient(x : Iterable, & : Array(Float64) -> _)
  h = 0.0001 
  xh = x
  x.map_with_index do |e, i|
    xh[i] += h
    fxh1 = yield(xh)
    xh[i] -= 2*h
    fxh2 = yield(xh)
    (fxh1 - fxh2) / (2*h)
  end
  
end

def gradient_descent(x : Iterable, lr=0.1, step_num=100, &block : Array(Float64) -> _)
  step_num.times {
    grad = numerical_gradient(x) do |x|
      block.call(x)
    end    
    x = x.zip(grad).map do |x, y| 
      x - lr * y
    end    
  }
  x
end
# mnist데이터를 읽는다.
# ```
# ``` 
def load_mnist
  read_data = ->(filename : String, skip : Int32, read_size : Int32){
    File.open(filename) do |fp|
      fp.read_buffering = false
      fp.skip(skip)
      slice = Bytes.new(read_size)
      t = Array(Array(UInt8)).new
      while(fp.read(slice) != 0)
        t << slice.to_a
      end
      t            
    end
  }
  x_train = Matrix.rows(read_data.call("./dataset/train-images-idx3-ubyte", 16, 784))
  t_train = Matrix.rows(read_data.call("./dataset/t10k-images-idx3-ubyte", 16, 784)) 
  x_test = Matrix.columns(read_data.call("./dataset/train-labels-idx1-ubyte", 8, 60000))
  t_test = Matrix.columns(read_data.call("./dataset/t10k-labels-idx1-ubyte", 8, 10000))
  {x_train, t_train, x_test, t_test}
end

def sigmoid(x)
  smap(x) { |x|
    1 / (1 + Math.exp(-x))
  }
end

def softmax(x : Iterable)
  c = x.max
  exp_a = x.map {|x| Math.exp(x-c)}
  sum_exp_a = exp_a.sum
  exp_a.map{|x| x/sum_exp_a} 
end

def mean_squared_error(y : Iterable, t : Iterable) : Iterable
  0.5 * (y.zip(t).map {|x, y| (x - y)**2}).sum
end

def cross_entropy_error(y : Iterable, t : Iterable) : Float64  
  idx = y.find {|e| e != 0}
  # NOTE: idx.try {-Math.log(t[idx])} doesn't work

  if idx ; -Math.log(t[idx]) else 0_f64  end
end

# def sigmoid(x)
#   if x.is_a? Iterable
#     x.map  { |e| sigmoid(e) }
#   else
#     1 / (1 + Math.exp(-x))
#   end
# end

def relu(x)
  smap(x) { |x| Math.max(0, x) }
end


# def relu(x)
#   if x.is_a? Iterable
#     x.map  { |e| relu(e) }
#   else
#     Math.max(0, x)
#   end

# end

# def relu(x : Array)
#   x.map { |e| relu(e) }
# end

def init_network
  network = Hash(String, Matrix(Float64)).new
  network["w1"] = Matrix[[0.1, 0.3, 0.5], [0.2, 0.4, 0.6]]
  network["b1"] = Matrix[[0.1, 0.2, 0.3]]
  network["w2"] = Matrix[[0.1, 0.4], [0.2, 0.5], [0.3, 0.6]]
  network["b2"] = Matrix[[0.1, 0.2]]
  network["w3"] = Matrix[[0.1, 0.3], [0.2, 0.4]]
  network["b3"] = Matrix[[0.1, 0.2]]
  return network
end

def forward(network, x)
  w1, w2, w3 = network["w1"], network["w2"], network["w3"]
  b1, b2, b3 = network["b1"], network["b2"], network["b3"]
  a1 = x * w1 + b1
  z1 = sigmoid(a1)
  a2 = z1 * w2 + b2
  z2 = sigmoid(a2)
  a3 = z2 * w3 + b3
  y = a3
end

x = Matrix[[1.0, 0.5]]

y = forward(init_network(), x)


#puts "tensor #{Tensor.from_array([[1,2],[5,2]]).astype(Float64)}"