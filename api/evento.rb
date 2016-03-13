require 'set'
require 'observer'
require_relative 'aposta'

# Formatting the way the sets print
class Set
  def to_s
    to_a.join("\n")
  end
end

class Evento
  include Observable
  attr_reader :home, :away, :date, :result, :homeodd, :drawodd, :awayodd, :apostas, :id

  def initialize(id, home, away, date, homeodd, drawodd, awayodd)
    @id = id
    @home = home
    @away = away
    @date = date
    @homeodd = homeodd
    @drawodd = drawodd
    @awayodd = awayodd
    @apostas = []
  end

  def setResult(result)
    if result == 'AWAY' || result == 'HOME' || result == 'DRAW'
      @result = result
      changed
      notify_observers(result)
    else
      raise :invalidResult
    end
  end

  def changeOdd(homeodd, drawodd ,awayodd)
    if(self.is_open?)
      @homeodd = homeodd
      @drawodd = drawodd
      @awayodd = awayodd
    else
      raise EventoFinished
    end
  end

  def addAposta(aposta)
    add_observer(aposta)
    @apostas.push(aposta)
  end

  def is_open?
    !@result
  end

  def to_s
    if @result
      "ID=#{@id} | #{@home} VS #{@away} Odds(#{@homeodd}|#{@drawodd}|#{@awayodd}) | Resultado Final:#{@result} | Date #{@date}"
    else
      "ID=#{@id} | #{@home} VS #{@away} Odds(#{@homeodd}|#{@drawodd}|#{@awayodd}) Date #{@date}"
    end
  end
end
