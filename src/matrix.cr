struct Matrix(T)
    def +(other : Matrix)
        raise DimensionMismatch.new unless column_count == other.column_count
        Matrix.new(@rows, @columns) do |i|
          at(i) + other[i % (other.column_count)]
        end
    end
end