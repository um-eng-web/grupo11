# isto é tipo uma classe main, o programa começa aqui

require_relative 'api/betess'
require_relative 'views/userview'

# ideia: criar uma pasta com uma view para cada modelo



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
      UserView.registerApostador
    when '2'
      UserView.loginUser
    when '3'
      puts BetESS.usersToString
    when '4'
      UserView.registerBookie
    when '5'
      puts 'Bye!'
      exit
    end
  end
end
