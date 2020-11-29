class PassengerCarriage < Carriage
  attr_reader :count_of_places, :taken_places, :free_places, :type, :number

  def initialize(number, count_of_places)
    @number = number
    @type = :passenger
    @count_of_places = count_of_places
    @free_places = count_of_places
    @taken_places = 0
  end

  def take_the_places
    self.taken_places += 1
    self.free_places = self.count_of_places - self.taken_places
    raise 'Свободных мест нет!' if taken_places >= count_of_places
  end

  protected

  attr_writer :taken_places, :free_places

end
