require_relative 'evento'
require_relative 'users'
require_relative 'aposta'

# exemplos do codigo, experimentar no interpretador é possível
# argumentos Evento (home, away, time, homeodd, drawodd, awayodd)
Eventos.add('Porto', 'Benfica', Time.local(2016, 3, 3, 16, 20), 3, 2, 4)
Eventos.add('Vitoria', 'Braga', Time.local(2016, 3, 3, 16, 20), 1, 1, 2)

# instanciar uma aposta (evento, resultado, valor, utilizador)
aposta = Aposta.new(Eventos.get(0), 'HOME', 5, 'francisco@mail')

# terminar um jogo com um resultado
Eventos.get(0).setResult('HOME')

puts(Eventos)

# ver quantos trocos esta aposta gerou
puts("#{aposta.getPremio} $")
