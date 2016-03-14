require_relative 'users/apostador'
require_relative 'users/bookie'
require_relative 'users/admin'
require_relative 'evento'
require_relative 'aposta'
require_relative 'exceptions'

module BetESS

  @@users = {}
  @@eventos = {}
  @@users["admin"] = Admin.new('admin','admin','admin')

  def self.registerApostador(email, password, name, creditos)
    raise EmailInUse if @@users[email]
    user = Apostador.new(email, password, name, creditos)
    @@users[email] = user
  end

  def self.registerBookie(email, password, name)
    raise EmailInUse if @@users[email]
    user = Bookie.new(email, password, name)
    @@users[email] = user
  end

  def self.newAposta(idEvento, result, valor, emailApostador)
    evento = @@eventos[idEvento]
    raise InvalidEvento unless evento
    apostador = @@users[emailApostador]
    raise InvalidApostador if !apostador || !apostador.is_a?(Apostador)
    aposta = Aposta.new(evento, result, valor, apostador)
    raise EventoFinished if evento.result
    apostador.removeCreditos(valor)
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
    @@users.delete(email)
  end

  def self.usersToString
    string = ''
    @@users.each do |key, value|
      string += "#{key} -> #{value}\n"
    end
    string
  end

  def self.getApostas
    apostas = []
    @@users.each do |key, value|
      apostas += value.apostas if value.is_a?(Apostador)
    end
    apostas
  end

  ##EVENTOS##

  def self.newEvento(home, away, date, homeodd, drawodd, awayodd, bookiemail)
    bookie = @@users[bookiemail]
    if !bookie || !bookie.is_a?(Bookie)
      raise InvalidBookie
    else
      id = @@eventos.length
      evento = Evento.new(id, home, away, date, homeodd, drawodd, awayodd)
      bookie.addEvento(evento)
      @@eventos[id] = evento
    end
  end

  def self.setResult(evento, result)
    @@eventos[evento].setResult(result)
  end

  def self.changeOdd(id, homeOdd, drawodd, awayodd)
    @@eventos[id].changeOdd(homeOdd, drawodd, awayodd)
  end

  def self.getEvento(id)
    @@eventos[id]
  end

  def self.checkID(id)
    if(@@eventos[id])
      true
    else
      false
    end
  end

  def self.getEventos()
    @@eventos.values
  end

  def self.eventosToString
    string = ''
    @@eventos.each do |key, value|
      string += "#{key} -> #{value}\n"
    end
    string
  end

end
