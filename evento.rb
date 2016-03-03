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
    @apostas = []
  end

  def setResult(result)
    if result == 'AWAY' || result == 'HOME' || result == 'DRAW'
      @result = result
      @apostas.each do |aposta|
        aposta.notify(result)
      end
    else
      raise 'Invalid result!'
    end
  end

  def addAposta(aposta)
    raise 'Evento terminou!' if @result
    @apostas.push(aposta)
  end

  def to_s
    "ID=#{@id} | #{@home} VS #{@away} Odds(#{@homeodd}|#{@drawodd}|#{@awayodd})"
  end
end

module Eventos
  @@eventos = {}

  def self.add(home, away, date, homeodd, drawodd, awayodd, bookiemail)
    bookie = Users.get(bookiemail)
    if !bookie || !bookie.is_a?(Bookie)
      raise 'Invalid Bookie'
    else
      id = @@eventos.length
      evento = Evento.new(id, home, away, date, homeodd, drawodd, awayodd)
      bookie.addEvento(evento)
      @@eventos[id] = evento
    end
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
