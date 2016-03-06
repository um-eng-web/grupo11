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
    apostador.notify(evento, premio)
  end

  def to_s
    "evento:#{@evento.id} resultado:#{@result} valor:#{@valor}"
  end
end
