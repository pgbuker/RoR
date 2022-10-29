# frozen_string_literal: true

class PassangerTrain < Train
  def initialize(number)
    @type = 'passanger'
    super
  end
end
