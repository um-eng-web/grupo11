class Aposta
  attr_reader :evento, :result, :valor, :user # home/away

  def initialize(evento, result, valor, user)
    @evento = evento
    @result = result
    @valor = valor
    @user = user
  end

  def getPremio
    result = @evento.result
    premio = 0
    if @evento.result == @result
      premio = @evento.awayodd * @valor if @evento.result == 'AWAY'
      premio = @evento.homeodd * @valor if @evento.result == 'HOME'
      premio = @evento.drawodd * @valor if @evento.result == 'DRAW'
    end
    premio
  end
end
