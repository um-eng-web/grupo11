# isto é tipo uma classe main, o programa começa aqui

require_relative 'api/betess'
require_relative 'views/usersview'
require_relative 'views/authview'

# ideia: criar uma pasta com uma view para cada modelo

# isto é a main

if __FILE__ == $PROGRAM_NAME

  # email password name balance
  apostador1 = BetESS.registerApostador('apostador1@email', '1234', 'apostador1', 60)
  apostador2 = BetESS.registerApostador('apostador2@email', '1234', 'apostador2', 120)
  apostador3 = BetESS.registerApostador('apostador3@email', '1234', 'apostador3', 40)
  bookie1 = BetESS.registerBookie('bookie1@email', '1234', 'bookie1')

  # exemplos do codigo, experimentar no interpretador é possível
  # argumentos Evento (home, away, time, homeodd, drawodd, awayodd)
  evento=BetESS.newEvento('Porto', 'Benfica', Time.local(2016, 3, 3, 16, 20), 3, 2, 4, bookie1.email)
  BetESS.newEvento('Vitoria', 'Braga', Time.local(2016, 3, 3, 16, 20), 1, 1, 2, bookie1.email)
  BetESS.newEvento('Sporting', 'Benfica', Time.local(2016, 4, 12, 16, 20), 3, 2, 4, bookie1.email)
  BetESS.newEvento('Vitoria', 'Porto', Time.local(2016, 4, 12, 16, 20), 1, 1, 2, bookie1.email)
  evento.setResult('HOME')

  # meter codigo main aqui
  loop do
    puts "\n"
    puts 'Welcome to BetESS'
    puts '1-Register'
    puts '2-Login'
    puts '3-Exit'
    puts "\n"
    case gets.chomp
    when '1'
      AuthView.registerApostador
    when '2'
      AuthView.loginUser
    when '3'
      puts 'Bye!'
      exit
    end
  end
end
