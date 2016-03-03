class Aposta
  attr_reader :evento, :result, :valor, :apostador, :premio # home/away

  def initialize(evento, result, valor, apostador)
    @evento = evento
    @result = result
    @valor = valor
    @apostador = apostador
  end

  def notify(_result)
    result = @evento.result
    premio = 0
    if @evento.result == @result
      premio = @evento.awayodd * @valor if @evento.result == 'AWAY'
      premio = @evento.homeodd * @valor if @evento.result == 'HOME'
      premio = @evento.drawodd * @valor if @evento.result == 'DRAW'
    end
    @premio = premio
    apostador.notify(evento, premio)
  end

  def to_s
    "evento:#{@evento.id} resultado:#{@result} valor:#{@valor}"
  end
end
