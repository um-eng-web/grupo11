class Aposta
  attr_reader :evento, :odd, :result, :valor, :apostador, :premio # home/away

  def initialize(evento, result, valor, apostador)
    @evento = evento
    @result = result
    @valor = valor
    @apostador = apostador
    case result
    when 'HOME'
      @odd = evento.homeodd
    when 'DRAW'
      @odd = evento.drawodd
    when 'AWAY'
      @odd = evento.awayodd
    end
    @premio = 0
  end

  def update(_result)
    @premio = @odd * @valor if @evento.result == @result
    if @premio > 0
      apostador.addCreditos(@premio)
      apostador.addNotif("Acabou de ganhar #{@premio} creditos no evento #{@evento.home} vs #{@evento.away}")
      puts "OBSERVER!!!! Apostador:#{apostador.email} ganhou #{@premio} creditos no evento #{@evento.home} vs #{@evento.away}"
    else
      apostador.addNotif("Nao ganhou nada no evento #{@evento.home} vs #{@evento.away}")
      puts "OBSERVER!!!! Apostador:#{apostador.email} nao ganhou nada no evento #{@evento.home} vs #{@evento.away}"
    end
  end

  def to_s
    if @premio > 0
      "evento:#{@evento.to_s_simple} apostador:#{@apostador.email} resultado:#{@result} valor:#{@valor} premio:#{@premio}"
    else
      "evento:#{@evento.to_s_simple} apostador:#{@apostador.email} resultado:#{@result} valor:#{@valor}"
    end
  end
end
