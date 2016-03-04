require_relative '../api/betess'

module UserView
  def self.registerApostador
    puts 'Enter your email!'
    email = gets.chomp
    puts 'Enter your name!'
    name = gets.chomp
    puts 'Enter your password!'
    password = gets.chomp
    puts 'Enter your starting balance'
    balance = gets.chomp.to_i
    if BetESS.registerApostador(email, password, name, balance)
      puts 'Register successfull!'
    else
      puts 'Email in use!'
    end
  end

  def self.registerBookie
    puts 'Enter your email!'
    email = gets.chomp
    puts 'Enter your name!'
    name = gets.chomp
    puts 'Enter your password!'
    password = gets.chomp
    if BetESS.registerBookie(email, password, name)
      puts 'Register Bookie successfull!'
    else
      puts 'Email in use!'
    end
  end

  def self.loginUser
    puts 'Enter your email!'
    email = gets.chomp
    puts 'Enter your password!'
    password = gets.chomp
    if BetESS.login(email, password)
      puts 'Login successfull!'
    else
      puts 'Wrong login!'
    end
  end

end
