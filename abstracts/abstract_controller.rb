
class AbstractController
  def initialize
    @twitter = TwitterAccountModel.get
    @fitbit = FitbitAccountModel.get
  end

  def post(value)
    @twitter.update(value)
  end
end
