# encoding: utf-8
#
# The join style defines how the intersection between two lines is drawn. There
# are three types: <code>:miter</code> (the default), <code>:round</code> and
# <code>:bevel</code>
#
# Just like <code>cap_style</code>, the difference between styles is better
# seen with thicker lines.
#
require File.expand_path(File.join(File.dirname(__FILE__),
                                   %w[.. example_helper]))

filename = File.basename(__FILE__).gsub('.rb', '.pdf')
Prawn::Example.generate(filename) do
  stroke_axis :height => 290
  
  self.line_width = 25
  y = 200
  
  3.times do |i|
    case i
    when 0; self.join_style = :miter
    when 1; self.join_style = :round
    when 2; self.join_style = :bevel
    end
    
    stroke do
      move_to(100, y)
      line_to(200, y + 100)
      line_to(300, y)
    end
    stroke_rectangle [400, y + 75], 50, 50
    
    y -= 100
  end
  
  reset_drawing_settings
end
