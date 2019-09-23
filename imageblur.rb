class Image
  def initialize(array, distance)
    @matrix = array
    @results = []
    @distance = distance.to_i
  end

  def display
    @matrix.each do |set|
      p set
    end
  end

  def findones
    @matrix.each_with_index do |row, y_index|
      row.each_with_index do |value, x_index|
        if value == 1
          @results.push([y_index, x_index])
        end
      end
    end
  end

  def blur
    @distance.times do
      findones

      @results.each do |coordinate|
        y = coordinate[0]
        x = coordinate[1]

        #Top
        @matrix[y-1][x] = 1 if y > 0
        #Bottom
        @matrix[y+1][x] = 1 if y < @matrix.length - 1
        #Left
        @matrix[y][x-1] = 1 if x > 0
        #Right
        @matrix[y][x+1] = 1 if x < @matrix[0].length - 1
      end
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
], 2)

image.blur
image.display