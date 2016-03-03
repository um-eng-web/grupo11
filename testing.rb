require_relative 'evento'
require_relative 'users'
require_relative 'aposta'



# email password name balance
apostador1 = Users.registerApostador('apostador1@email', '1234', 'apostador1', 60)
apostador2 = Users.registerApostador('apostador2@email', '1234', 'apostador2', 120)
apostador3 = Users.registerApostador('apostador3@email', '1234', 'apostador3', 40)
bookie1 = Users.registerBookie('bookie1@email', '1234', 'bookie1')

# exemplos do codigo, experimentar no interpretador é possível
# argumentos Evento (home, away, time, homeodd, drawodd, awayodd)
Eventos.add('Porto', 'Benfica', Time.local(2016, 3, 3, 16, 20), 3, 2, 4, bookie1.email)
Eventos.add('Vitoria', 'Braga', Time.local(2016, 3, 3, 16, 20), 1, 1, 2, bookie1.email)

puts("Eventos\n\n")
puts(Eventos)
puts '------------------------------------------'

puts("Utilizadores\n\n")
puts(Users)
puts '------------------------------------------'

puts("Testar apostas\n\n")
# instanciar uma aposta (evento, resultado, valor, utilizador)
# 5*3 = 15

aposta = Users.newAposta(0, 'HOME', 5, 'apostador1@email')

puts(apostador1)

# terminar um jogo com um resultado
Eventos.get(0).setResult('HOME')

puts(Eventos)

puts '------------------------------------------'

# ver quantos trocos esta aposta gerou
puts("#{aposta.getPremio} $")
