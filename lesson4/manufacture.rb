# frozen_string_literal: true

module Manufacture
  def manufacture_title(title)
    puts title.to_s
    self.manufacture = title
  end

  protected

  attr_accessor :manufacture
end
