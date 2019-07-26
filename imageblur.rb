class Image
  def initialize(array)
    @matrix = array
  end
  def output_image
    @matrix.each do |set|
      p set
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image