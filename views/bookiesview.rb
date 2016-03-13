require 'time'

class BookiesView
  def initialize(bookie)
    @bookie = bookie
  end

  def menu
    flag = true
    while flag
      puts '1 - Eventos para aposta'
      puts '2 - Apostas por terminar'
      puts "3 - Historico de eventos"
      puts "4 - Historico de apostas"
      puts '5 - Criar evento'
      puts '6 - Fechar evento'
      puts '7 - Editar odds de evento'
      puts '8 - Voltar atras'
      puts "\n\n"
      case gets.chomp
      when '1'
        puts BetESS.getEventos.select(&:is_open?)
      when '2'
        puts BetESS.getApostas.select { |aposta| aposta.evento.is_open? }
      when '3'
        puts BetESS.getEventos.select { |evento| !evento.is_open? }
      when '4'
        puts BetESS.getApostas.select { |aposta| !aposta.evento.is_open? }
      when '5'
        novoEvento
      when '6'
        fecharEvento
      when '7'
        alterarOdds
      when '8'
        flag = false
      end
    end
  end

  def novoEvento
    puts 'Equipa da casa'
    home = gets.chomp
    puts 'Equipa visitante'
    away = gets.chomp
    puts 'Data e hora do evento YYYY-MM-dd HH:mm:ss'
    time = Time.parse(gets.chomp)
    puts 'Odd vitoria equipa da casa'
    homeodd = gets.chomp.to_f
    puts 'Odd de empate'
    drawodd = gets.chomp.to_f
    puts 'Odd vitoria equipa visitante'
    awayodd = gets.chomp.to_f
    BetESS.newEvento(home, away, time, homeodd, drawodd, awayodd, @bookie.email)
    rescue ArgumentError
      puts 'Data invalida'
  end

  def fecharEvento
    puts 'ID do evento?'
    evento = BetESS.getEvento(gets.chomp.to_i)
    if evento
      puts 'Resultado final? (HOME, DRAW ou AWAY)'
      result = gets.chomp
      evento.setResult(result)
    else
      puts 'Evento nao existe!'
    end
  rescue EventoFinished
    puts 'Este evento ja terminou!'
  end

  def alterarOdds
    puts 'ID do evento?'
    evento = gets.chomp.to_i
    if BetESS.checkID(evento)
      puts 'Odd vitoria equipa da casa'
      homeodd = gets.chomp.to_f
      puts 'Odd de empate'
      drawodd = gets.chomp.to_f
      puts 'Odd vitoria equipa visitante'
      awayodd = gets.chomp.to_f
      BetESS.changeOdd(evento, homeodd, drawodd, awayodd)
    else
      puts 'Evento nao existe!'
    end
  rescue EventoFinished
    puts 'Este evento ja terminou!'
  end

end
