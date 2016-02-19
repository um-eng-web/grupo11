require 'set'
load 'aposta.rb'

# Formatting the way the sets print
class Set
  def to_s
    to_a.join("\n")
  end
end

class Evento
  attr_reader :home, :away, :date, :result, :homeodd, :drawodd, :awayodd, :apostas

  def initialize(home, away, date, homeodd, drawodd, awayodd)
    @home = home
    @away = away
    @date = date
    @homeodd = homeodd
    @drawodd = drawodd
    @awayodd = awayodd
  end

  def setResult(result)
    if result == 'AWAY' || result == 'HOME' || result == 'DRAW'
      @result = result
    else
      raise 'Invalid team!'
    end
  end

  def to_s
    "#{@home} VS #{@away} Odds(#{@homeodd}|#{@drawodd}|#{@awayodd})"
  end
end

module Eventos
  @@eventos = {}

  def self.add(evento)
    id = @@eventos.length
    @@eventos[id] = evento
  end

  def self.get(id)
    @@eventos[id]
  end

  def self.to_s
    @@eventos.to_s
  end
end



# datas em ruby -> ano mes di
