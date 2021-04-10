struct Matrix(T)
    def +(other : Matrix)
        raise DimensionMismatch.new unless column_count == other.column_count
        Matrix.new(@rows, @columns) do |i|
          at(i) + other[i % (other.column_count)]
        end
    end

    def each_row
     each_slice(column_count)
    end

    def each_col
      0...upto(column_count) do |col|
        yield column(col)
      end
    end
    def row_max_index
      each_row.map { |r|
        r.index(r.max)
      }.to_a.to_m
    end
end
