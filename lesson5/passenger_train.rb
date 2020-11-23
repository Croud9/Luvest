class CargoTrain < Train
  attr_reader :type

  def initialize
    @type = :cargo
    super(register_instance)
  end

end
