# frozen_string_literal: true

class PassengerTrain < Train
  attr_reader :type

  def initialize
    @type = :passenger
    super(register_instance)
  end
end
