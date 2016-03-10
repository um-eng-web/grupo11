require_relative '../api/betess'
require_relative 'bookiesview'
require_relative 'adminsview'

class AuthView
  def self.registerApostador
    puts 'Enter your email!'
    email = gets.chomp
    puts 'Enter your name!'
    name = gets.chomp
    puts 'Enter your password!'
    password = gets.chomp
    puts 'Enter your starting creditos'
    creditos = gets.chomp.to_i
    begin
      BetESS.registerApostador(email, password, name, creditos)
      puts 'Register successfull!'
    rescue EmailInUse
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
      elsif user.is_a?(Admin)
        AdminsView.menu
      end
    else
      puts 'Wrong login!'
    end
  end
end
