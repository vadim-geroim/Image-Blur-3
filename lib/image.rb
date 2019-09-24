class Image
  attr_accessor :new_image


  def initialize(image)
    @original_image = image
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


  def blur(distance)
    @new_image = build_new_image(@original_image) 
    image_height = @new_image.length - 1
    image_width = @new_image.first.length - 1

    @original_image.each_with_index do |array, row|
      array.each_with_index do |element, col|
        if element == 1 
          distance.times do |number|
            number += 1
            @new_image[row][col] = 1
            @new_image[row + number][col] = 1 if  row + number <= image_height
            @new_image[row - number][col] = 1 if  row - number >= 0 
            @new_image[row][col + number] = 1 if col + number <= image_width   
            @new_image[row][col - number] = 1 if col - number >= 0
          end
        end
      end
    end
    @new_image 
  end
end





