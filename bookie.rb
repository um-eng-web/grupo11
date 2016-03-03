require_relative 'user'

class Bookie < User
  attr_reader :eventos

  def initialize(email, password, name)
    super(email,password,name)
    @eventos = []
  end

  def to_s
    "email:#{@email} name:#{@name} balance:#{@balance} eventos:#{@eventos}"
  end

end
