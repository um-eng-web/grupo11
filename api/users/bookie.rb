require_relative 'user'

class Bookie < User
  attr_reader :eventos

  def initialize(email, password, name)
    super(email, password, name)
    @eventos = []
  end

  def addEvento(evento)
    @eventos.push(evento)
  end

  def to_s
    if eventos.size > 0
      eventos = "\n\t"
      eventos += @eventos.to_a.join("\n\t")
    end
    "|Bookie| email:#{@email} name:#{@name} eventos:#{eventos}"
  end
end
