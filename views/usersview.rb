class UsersView
  def initialize(user)
    @user = user
  end

  def menu
    flag = true
    while flag
      puts "\nCréditos disponíveis: #{@user.balance} \n"
      puts '1 - Eventos para apostar'
      puts '2 - Apostas por terminar'
      puts "3 - Histórico de eventos"
      puts "4 - Histórico de apostas"
      puts '5 - Efetuar aposta'
      puts "6 - Voltar atrás"
      puts "\n\n"
      case gets.chomp
      when '1'
        puts BetESS.getEventos.select(&:is_open?)
      when '2'
        puts @user.apostas.select { |aposta| aposta.evento.is_open? }
      when '3'
        puts BetESS.getEventos.select { |evento| !evento.is_open? }
      when '4'
        puts @user.apostas.select { |aposta| !aposta.evento.is_open? }
      when '5'
        novaAposta
      when '6'
        flag = false
      end
    end
  end

  def novaAposta
    puts 'ID do evento?'
    id = gets.chomp.to_i
    puts 'Resultado (HOME, AWAY ou DRAW)'
    result = gets.chomp
    puts 'Quantia a apostar?'
    valor = gets.chomp.to_i
    BetESS.newAposta(id, result, valor, @user.email)
    puts 'Aposta feita com sucesso'
  rescue NotEnoughMoney
    puts 'Não possui fundos suficiente para esta aposta!'
  rescue EventoFinished
    puts 'Este evento já terminou!'
  end
end
