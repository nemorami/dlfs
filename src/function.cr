 class Function
    def initialize(input : Variable)
        @input = input
        @output = Variable.new(forward(input))
        @output.set_creator(this)
    end

    def forward(x : Variable)
    end
    
    def backward(gy : Variable)
    end
end