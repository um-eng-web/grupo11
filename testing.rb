require_relative 'api/evento'
require_relative 'api/betess'
require_relative 'api/aposta'

# email password name balance
apostador1 = BetESS.registerApostador('apostador1@email', '1234', 'apostador1', 60)
apostador2 = BetESS.registerApostador('apostador2@email', '1234', 'apostador2', 120)
apostador3 = BetESS.registerApostador('apostador3@email', '1234', 'apostador3', 40)
bookie1 = BetESS.registerBookie('bookie1@email', '1234', 'bookie1')

# exemplos do codigo, experimentar no interpretador é possível
# argumentos Evento (home, away, time, homeodd, drawodd, awayodd)
BetESS.newEvento('Porto', 'Benfica', Time.local(2016, 3, 3, 16, 20), 3, 2, 4, bookie1.email)
BetESS.newEvento('Vitoria', 'Braga', Time.local(2016, 3, 3, 16, 20), 1, 1, 2, bookie1.email)
BetESS.newEvento('Sporting', 'Benfica', Time.local(2016, 4, 12, 16, 20), 3, 2, 4, bookie1.email)
BetESS.newEvento('Vitoria', 'Porto', Time.local(2016, 4, 12, 16, 20), 1, 1, 2, bookie1.email)

puts("Eventos\n\n")
puts(BetESS.eventosToString)
puts '------------------------------------------'

puts("Utilizadores\n\n")
puts(BetESS.usersToString)
puts '------------------------------------------'

puts("Testar apostas\n\n")
# instanciar uma aposta (evento, resultado, valor, utilizador)
# 5*3 = 15r

#como salvar as excepçoes
begin
  aposta = BetESS.newAposta(0, 'HOME', 5, 'apostador1@email')
  aposta1 = BetESS.newAposta(0, 'HOME', 20, 'apostador2@email')
rescue NotEnoughMoney
  puts "Não tem dinheiro para apostar!"
end

puts("Balance apostador1=#{apostador1.balance}\n\n")

# terminar um jogo com um resultado
BetESS.getEvento(0).setResult('HOME')

puts("\nBalance apostador1=#{apostador1.balance}\n\n")

puts("--------------------------------------")

puts "--Eventos em que o Benfica participa--\n\n"
puts BetESS.getEventos.select { |evento| evento.home=="Benfica" || evento.away=="Benfica"}

puts "\n\n--Eventos mês de março--\n\n"
puts BetESS.getEventos.select { |evento| evento.date.month == 3}

puts "\n\n--Apostas com valor superior a 10--\n\n"
puts BetESS.getApostas.select { |aposta| aposta.valor > 10}

puts "\n\n--Apostas do apostador1--\n\n"
puts BetESS.getApostas.select { |aposta| aposta.apostador.email == "apostador1@email"}
