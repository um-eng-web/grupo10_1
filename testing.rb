require_relative 'bet_house_API'

class Testing

  @house

  def initialize
    @house = BetHouseAPI.new
  end


  def testRegistration
    @house.registerUser #voluntario:4:ricardo:4321
    @house.registerBookie  #onofrio:novapass
  end

  def testAuthentication
    @house.authenticateUser
    @house.authenticateBookie
  end

end

t = Testing.new
t.testRegistration