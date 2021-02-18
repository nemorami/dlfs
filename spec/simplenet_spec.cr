require "./spec_helper"

describe SimpleNet do
    describe "predict" do
        it "run" do
            sn = SimpleNet.new
            puts sn.predict(Matrix.row(0.6, 0.9))
        end
    end
end