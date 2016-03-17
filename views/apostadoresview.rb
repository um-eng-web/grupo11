class ApostadoresView
  def initialize(user)
    @user = user
  end

  def menu
    flag = true
    while flag
      puts "\nTem #{@user.unread_notifs} notificacoes por ler!" if @user.unread_notifs > 0
      puts "\nCreditos disponiveis: #{@user.creditos} \n"
      puts '1 - Eventos para apostar'
      puts '2 - Apostas por terminar'
      puts '3 - Historico de eventos'
      puts '4 - Historico de apostas'
      puts '5 - Efetuar aposta'
      puts '6 - Adicionar creditos'
      puts '7 - Levantar creditos'
      puts '8 - Ler notificacoes'
      puts '9 - Voltar atras'
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
        addCreditos
      when '7'
        levantarCreditos
      when '8'
        getNotifs
      when '9'
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
    valor = gets.chomp.to_f
    BetESS.newAposta(id, result, valor, @user.email)
    puts 'Aposta feita com sucesso'
  rescue NotEnoughMoney
    puts 'Nao possui fundos suficiente para esta aposta!'
  rescue EventoFinished
    puts 'Este evento ja terminou!'
  rescue InvalidResult
    puts 'Resultado invalido!'
  end

  def addCreditos
    puts 'Quantidade de creditos a adicionar?'
    creditos = gets.chomp.to_f
    @user.addCreditos(creditos)
    puts 'Creditos adicionados!!'
  end

  def levantarCreditos
    puts "Possui #{@user.creditos} creditos. Quanto deseja levantar?"
    creditos = gets.chomp.to_f
    @user.removeCreditos(creditos)
    puts 'Creditos removidos!!'
  rescue NotEnoughMoney
    puts 'Nao tem creditos suficientes!'
  end

  def getNotifs
    puts "As suas notificacoes:\n\n"
    for notif in @user.getNotifs
      puts notif
    end
  end
end
