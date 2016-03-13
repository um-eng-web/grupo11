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
    apostador.addCreditos(@premio)
    puts "OBSERVER!!!! Apostador:#{apostador.email} ganhou #{@premio} creditos"
  end

  def to_s
    if @premio > 0
      "evento:#{@evento.id} apostador:#{@apostador.email} resultado:#{@result} valor:#{@valor} premio:#{@premio}"
    else
      "evento:#{@evento.id} apostador:#{@apostador.email} resultado:#{@result} valor:#{@valor}"
    end
  end
end
