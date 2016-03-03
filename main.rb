# isto é tipo uma classe main, o programa começa aqui

require_relative 'evento'
require_relative 'users'
require_relative 'aposta'

# ideia: criar uma pasta com uma view para cada modelo

def registerApostador
  puts 'Enter your email!'
  email = gets.chomp
  puts 'Enter your name!'
  name = gets.chomp
  puts 'Enter your password!'
  password = gets.chomp
  puts 'Enter your starting balance'
  balance = gets.chomp.to_i
  if Users.registerApostador(email, password, name, balance)
    puts "Register successfull!"
  else
    puts "Email in use!"
  end
end

def registerBookie
  puts 'Enter your email!'
  email = gets.chomp
  puts 'Enter your name!'
  name = gets.chomp
  puts 'Enter your password!'
  password = gets.chomp
  if Users.registerBookie(email, password, name)
    puts "Register Bookie successfull!"
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
    puts '4-Register bookie (debug)'
    puts '5-Exit'
    puts "\n"
    case gets.chomp
    when '1'
      registerApostador
    when '2'
      loginUser
    when '3'
      puts Users
    when '4'
      registerBookie
    when '5'
      puts 'Bye!'
      exit
    end
  end
end
