class MulLayer
    def initialize(@x : Float64|Int32 = 0 , @y : Float64|Int32 = 0)
    end
    def forward
        @x * @y
    end
    def forward(x, y)
        @x = x 
        @y = y 
        forward
    end

    def backward(dout)
        {dout * @x, dout * @y}
    end
end

class AddLayer
    def forward(x, y)
        x + y 
    end

    def backward(dout)
        {dout, dout}    
    end
end

class Relu

    def forward(x)
        x.map do |e|
            (e > 0) ? e : 0
        end
    end
    
    def backward(dout)
        forward(dout)
    end
end

class Sigmoid
    def forward(x)
        @out = 1 / (1 + x.map &.exp)        
    end

    def backward(dout)    
        dout * (1.0 - out) * out
    end
end

class Affine
    def initialize(@w, @b)
    
    end

    def forward(x)
        @x = x
        x * @w + @b
    end

    def backward(dout)
        dx = dout * @w.transpose
        @dw = @x.transpose * dout
        @db = 
        dx
    end
end