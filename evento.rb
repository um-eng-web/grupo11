require 'set'
require_relative 'aposta'

# Formatting the way the sets print
class Set
  def to_s
    to_a.join("\n")
  end
end

class Evento
  attr_reader :home, :away, :date, :result, :homeodd, :drawodd, :awayodd, :apostas, :id

  def initialize(id, home, away, date, homeodd, drawodd, awayodd)
    @id = id
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
      raise 'Invalid result!'
    end
  end

  def to_s
    "ID=#{@id} | #{@home} VS #{@away} Odds(#{@homeodd}|#{@drawodd}|#{@awayodd})"
  end
end

module Eventos
  @@eventos = {}

  def self.add(home, away, date, homeodd, drawodd, awayodd, bookiemail)
    bookie = Users.get(bookiemail)
    if (!bookie || !bookie.is_a?(Bookie))
      raise "Invalid Bookie"
    end
    id = @@eventos.length
    evento = Evento.new(id, home, away, date, homeodd, drawodd, awayodd)
    @@eventos[id] = evento
  end

  def self.get(id)
    @@eventos[id]
  end

  def self.to_s
    string = ''
    @@eventos.each do |key, value|
      string += "#{key} -> #{value}\n"
    end
    string
  end
end

# datas em ruby -> ano mes di
