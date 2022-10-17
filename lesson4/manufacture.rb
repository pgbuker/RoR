module Manufacture
  def manufacture_title(title)
    puts "#{title}"
    self.manufacture = title
  end

  protected
  attr_accessor :manufacture
end
