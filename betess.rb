# isto é tipo uma classe main, o programa começa aqui

load 'evento.rb'
load 'users.rb'
load 'aposta.rb'

# ideia: criar uma pasta com uma view para cada modelo

def registerUser
  puts 'Enter your email!'
  email = gets.chomp
  puts 'Enter your name!'
  name = gets.chomp
  puts 'Enter your password!'
  password = gets.chomp
  if Users.register(email, password, name)
    puts "Register successfull!"
  else
    puts "Email in use!"
  end
end

def loginUser
  puts "Enter your email!"
  email = gets.chomp
  puts 'Enter your password!'
  password = gets.chomp
  if Users.login(email, password)
    puts 'Login successfull!'
  else
    puts 'Wrong login!'
  end
end

# isto é a main

if __FILE__ == $PROGRAM_NAME
  # meter codigo main aqui
  loop do
    puts "\n"
    puts 'Welcome to BetESS'
    puts '1-Register'
    puts '2-Login'
    puts '3-List users (debug)'
    puts "\n"
    case gets.chomp

    when '1'
      registerUser
    when '2'
      loginUser
    when '3'
      puts Users
    end
  end
end

# exemplos do codigo, experimentar no interpretador é possível
Eventos.add(Evento.new('Porto', 'Benfica', Time.local(2016, 3, 3, 16, 20), 3, 2, 4))
Eventos.add(Evento.new('Vitoria', 'Braga', Time.local(2016, 3, 3, 16, 20), 1, 1, 2))

# instanciar uma aposta (evento, resultado, valor, utilizador)
aposta = Aposta.new(Eventos.get(0), 'HOME', 5, 'francisco@mail')

# terminar um jogo com um resultado
Eventos.get(0).setResult('HOME')

puts(Eventos)

# ver quantos trocos esta aposta gerou
puts("#{aposta.getPremio} $")
