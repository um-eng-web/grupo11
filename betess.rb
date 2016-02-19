load "evento.rb"
load "users.rb"
load "aposta.rb"

def registerUser
  puts "Enter your email!"
  email = gets.chomp
  puts "Enter your name!"
  name = gets.chomp
  puts "Enter your password!"
  password = gets.chomp
  Users.register(email,password,name)
end

def loginUser
  puts "Enter your email!"
  email = gets.chomp
  puts "Enter your password!"
  password = gets.chomp
  if Users.login(email,password)
    puts "Login successfull!"
  else
    puts "Wrong login!"
  end
end

if __FILE__ == $0
  #meter codigo main aqui
end

#exemplos
Eventos.add(Evento.new('Porto', 'Benfica', Time.local(2016, 3, 3, 16, 20), 3, 2, 4))
Eventos.add(Evento.new('Vitoria', 'Braga', Time.local(2016, 3, 3, 16, 20), 1, 1, 2))

aposta = Aposta.new(Eventos.get(0), 'HOME', 5, 'Francisco')

Eventos.get(0).setResult('HOME')

puts(Eventos)
puts("#{aposta.getPremio} $")
