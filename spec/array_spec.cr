require "./spec_helper"

describe Array do
    describe "to_m" do
        # it "1 demension array" do
        #     a = [1,2,3]
        #     a.to_m.should eq(Matrix.row(1,2,3))
            
            
        # end
        it "2 demension array" do
            a = [[1,2,3],[4,5,6]].to_tensor
            #a.to_m.should eq Matrix.rows([[1,2,3], [4,5,6]])
            puts "a => #{a}, #{a[0]}"
            a.each { |x|
                puts "x => #{x}"
            }
            
            
            
        end
    end
end