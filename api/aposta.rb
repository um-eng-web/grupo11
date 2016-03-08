class Aposta
  attr_reader :evento, :homeodd, :drawodd, :awayodd, :result, :valor, :apostador, :premio # home/away

  def initialize(evento, result, valor, apostador)
    @evento = evento
    @result = result
    @valor = valor
    @apostador = apostador
    @homeodd = evento.homeodd
    @drawodd = evento.drawodd
    @awayodd = evento.awayodd
    @premio = 0
  end

  def notify(_result)
    result = @evento.result
    premio = 0
    if @evento.result == @result
      premio = @awayodd * @valor if @evento.result == 'AWAY'
      premio = @homeodd * @valor if @evento.result == 'HOME'
      premio = @drawodd * @valor if @evento.result == 'DRAW'
    end
    @premio = premio
    apostador.update(evento, premio)
  end

  def to_s
    if @premio > 0
      "evento:#{@evento.id} resultado:#{@result} valor:#{@valor} premio:#{@premio}"
    else
      "evento:#{@evento.id} resultado:#{@result} valor:#{@valor}"
    end
  end
end
