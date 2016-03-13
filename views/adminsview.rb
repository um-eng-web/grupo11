class AdminsView
  def self.menu
    flag = true
    while flag
      puts "\n"
      puts '1-List users'
      puts '2-Register bookie'
      puts '3-Exit'
      puts "\n"
      case gets.chomp
      when '1'
        puts BetESS.usersToString
      when '2'
        self.registerBookie
      when '3'
        flag = false
      end
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
end
