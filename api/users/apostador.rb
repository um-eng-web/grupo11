require_relative 'user'

class Apostador < User
  attr_reader :apostas, :creditos, :unread_notifs

  def initialize(email, password, name, creditos)
    super(email, password, name)
    @creditos = creditos
    @apostas = []
    @notifs = []
    @unread_notifs = 0
  end

  def addAposta(aposta)
    @apostas.push(aposta)
  end

  def addNotif(notif)
    @unread_notifs += 1
    @notifs.push(notif)
  end

  def getNotifs()
    @unread_notifs = 0
    @notifs
  end

  def removeCreditos(creditos)
    raise NotEnoughMoney if creditos > @creditos
    @creditos -= creditos
  end

  def addCreditos(creditos)
    @creditos += creditos
  end

  def to_s
    if apostas.size > 0
      apostas = "\n\t"
      apostas += @apostas.to_a.join("\n\t")
    end
    "email:#{@email} name:#{@name} creditos:#{@creditos} apostas:#{apostas}"
  end
end
