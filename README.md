# Image-Blur-3
Solution and Tests to the Columbia University Image #3 problem. 

## Project structure
- `lib/image.rb`  - contains solution
- `spec/image_spec.rb` - includes three different examples

## Description of class Image
- the method `build_new_image` - gets as a parameter an image and 
converts it to the same dimention image with only zeros
- the method `set_ones` - performs changes up, down, left and right to set one
- the method `blur` - takes as a parameter distance, converts it
to a new image and return the result
- the method `print_image` - prints an image to a console


## Solution explanation
- The constructor of the class Image takes as a parameter
desired image for conversion. It creates instance variables
  - `@original_image` to store the original image; 
  - `@new_image` to store the result after convertion;
  - `@image_height` and `@image_width` to store the array's dimention
  - `@ones` - to store new identificators where one is set before, and it's
blank from the very beginning.
- When the method `blur` is called it will iterate through the two-dimension array
and if meet one the following block will be executed the number of times equal 
specified distance in a parameter of the method. What should happen next?
If distance more than one it requires to iterate through each element of array
contains all ones set before. During iteration the method `set_ones` is called(please
refere description about the method above). The method `blur` returns `@new_image` as 
a result of convertion. 

## Test execution
- Run `bundle install`
- Open terminal window
- From the project directory run `rspec`

## Comments
Rspec test validation was perfomed only for single case example where image contains only one 1.

