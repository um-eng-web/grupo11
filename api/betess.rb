require_relative 'users/apostador'
require_relative 'users/bookie'
require_relative 'evento'
require_relative 'aposta'

module BetESS

  @@users = {}
  @@eventos = {}

  def self.registerApostador(email, password, name, balance)
    return nil if @@users[email]
    user = Apostador.new(email, password, name, balance)
    @@users[email] = user
  end

  def self.registerBookie(email, password, name)
    return nil if @@users[email]
    user = Bookie.new(email, password, name)
    @@users[email] = user
  end

  def self.newAposta(idEvento, result, valor, emailApostador)
    evento = @@eventos[idEvento]
    raise "Evento inválido" unless evento
    apostador = @@users[emailApostador]
    raise "Apostador inválido" if !apostador || !apostador.is_a?(Apostador)
    aposta = Aposta.new(evento, result, valor, apostador)
    evento.addAposta(aposta)
    apostador.addAposta(aposta)
    aposta
  end

  def self.login(email, password)
    user = @@users[email]
    user if user && (user.password == password)
  end

  def self.getUser(email)
    user = @@users[email]
    user
  end

  def self.deleteUser(email)
    user = @@users.delete(email)
  end

  def self.usersToString
    string = ''
    @@users.each do |key, value|
      string += "#{key} -> #{value}\n"
    end
    string
  end

  ##EVENTOS##

  def self.newEvento(home, away, date, homeodd, drawodd, awayodd, bookiemail)
    bookie = user = @@users[bookiemail]
    if !bookie || !bookie.is_a?(Bookie)
      raise 'Invalid Bookie'
    else
      id = @@eventos.length
      evento = Evento.new(id, home, away, date, homeodd, drawodd, awayodd)
      bookie.addEvento(evento)
      @@eventos[id] = evento
    end
  end

  def self.getEvento(id)
    @@eventos[id]
  end

  def self.eventosToString
    string = ''
    @@eventos.each do |key, value|
      string += "#{key} -> #{value}\n"
    end
    string
  end

end
