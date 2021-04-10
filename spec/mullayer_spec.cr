require "./spec_helper"

describe MulLayer do 
    describe "forward" do
        it "for_back" do
            apple = 100
            apple_num = 2
            tax = 1.1
            mul_apple_layer = MulLayer.new(apple, apple_num)
            mul_tax_layer = MulLayer.new()
            #순전파
            apple_price = mul_apple_layer.forward
            mul_tax_layer.forward(apple_price, tax).to_i32.should eq(220)
            #역전파
            dprice = 1
            dapple_price, d tax = mul_tax_layer.backward(dprice)
             
        end
    end
end