require "./spec_helper"

describe Dlfs do
  # TODO: Write tests
  describe "sigmoid" do

    it "sigmoid(0) is should 0.5" do
      sigmoid(0_f64).should eq 0.5
      #puts sigmoid(0_f64)
    end
    
    it "sigmoid(Array)" do
      a = [0.30000000000000004, 0.7, 1.1]
      re = [0.574442516811659, 0.6681877721681662, 0.7502601055951177]
      #puts "a => #{a}, re => #{re}"
      sigmoid(a).should eq re
    end

    it "sigmoid(Matrix)" do
      a = [0.30000000000000004, 0.7, 1.1]
      re = [0.574442516811659, 0.6681877721681662, 0.7502601055951177]
      #puts "a => #{a}, re => #{re}"
      sigmoid(a).should eq re
    end
  end
  
  describe "softmax" do
    it "softmax 0.3, 2.9, 4.0" do
      softmax([0.3, 2.9, 4.0]).sum.should eq 1
    end

    it "softmax 0, 0, 0" do
      puts softmax([0, 0, 0]).sum.should eq 1
    end
  end

  describe "load_mnist" do
    it "read" do      
      x_train, t_train, x_test, t_test = load_mnist
      
      x_train.row_count.should eq 60000
      t_train.row_count.should eq 10000
      x_test.row_count.should eq 60000
      t_test.row_count.should eq 10000
      
    end
  end
  it "works" do
    false.should eq(false)
  end
end
