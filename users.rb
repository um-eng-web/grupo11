require_relative 'user'
require_relative 'bookie'
require_relative 'apostador'

module Users
  @@users = {}

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
    evento = Eventos.get(idEvento)
    raise "Evento inválido" unless evento
    apostador = @@users[emailApostador]
    raise "Apostador inválido" if !apostador || !apostador.is_a?(Apostador)
    aposta = Aposta.new(evento, result, valor, emailApostador)
    apostador.addAposta(aposta)
    aposta
  end

  def self.login(email, password)
    user = @@users[email]
    user if user && (user.password == password)
  end

  def self.get(email)
    user = @@users[email]
    user
  end

  def self.delete(email)
    user = @@users.delete(email)
  end

  def self.to_s
    string = ''
    @@users.each do |key, value|
      string += "#{key} -> #{value}\n"
    end
    string
  end
end
