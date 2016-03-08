require_relative '../api/betess'
require_relative 'bookiesview'

class AuthView
  def self.registerApostador
    puts 'Enter your email!'
    email = gets.chomp
    puts 'Enter your name!'
    name = gets.chomp
    puts 'Enter your password!'
    password = gets.chomp
    puts 'Enter your starting balance'
    balance = gets.chomp.to_i
    begin
      BetESS.registerApostador(email, password, name, balance)
      puts 'Register successfull!'
    rescue EmailInUse
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
    user = BetESS.login(email, password)
    if user
      puts 'Login successfull!'
      if user.is_a?(Apostador)
        usersview = UsersView.new(user)
        usersview.menu
      elsif user.is_a?(Bookie)
        bookiesview = BookiesView.new(user)
        bookiesview.menu
      end
    else
      puts 'Wrong login!'
    end
  end
end
