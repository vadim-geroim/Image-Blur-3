class Image
  attr_accessor :new_image, :image_width, :image_height, :ones, :current_ones

  def initialize(image)
    @original_image = image
    @image_height = image.length - 1
    @image_width = image.first.length - 1
    @new_image = build_new_image(image) 
    @ones = []
  end

  #This class method prints image
  def self.print_image(image)
    image.each do |element|
      puts element.join
    end
  end

  #This method build a new image with all zeros
  def build_new_image(image)
    image.map do |array|
      array.map {|element| element = 1 ? element = 0 : element = 0 }
    end
  end

 def change(row, col)
  @new_image[row][col] = 1
  if  row + 1 <= @image_height
   @new_image[row + 1][col] = 1
   @ones << [row + 1, col]
  end
  if  row - 1 >= 0 
  @new_image[row - 1][col] = 1 
  @ones << [row -1, col]
  end  
  if col + 1 <= @image_width
  @new_image[row][col + 1] = 1
  @ones << [row, col + 1]
  end   
  if col - 1 >= 0
  @new_image[row][col - 1] = 1
  @ones << [row, col -1]
  end
 end 

  def blur(distance)
    @original_image.each_with_index do |array, row|
      array.each_with_index do |element, col|
        if element == 1 
          distance.times do |number|
            number += 1
            change(row, col)
            if number > 1
              @current_ones = @ones
              @ones = []
              @current_ones.each { | element | change(element[0], element[1]) }
            end  
          end
        end
      end
    end
    @new_image 
  end
end

