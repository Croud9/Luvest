class CargoCarriage < Carriage
  attr_reader :total_space, :occupied_space, :free_space, :type, :number

  def initialize(number, total_space)
    @number = number
    @type = :cargo
    @total_space = total_space
    @free_space = total_space
    @occupied_space = 0
  end

  def occupy_space(space)
    self.occupied_space += space
    self.free_space = self.total_space - self.occupied_space
    raise 'Вагон заполнен!' if free_space <= 0
  end

  protected

  attr_writer :free_space, :occupied_space

end
