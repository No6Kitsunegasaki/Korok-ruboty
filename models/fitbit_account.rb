class FitbitAccountModel < AbstractModel
  def self.get
    Fitgem::Client.new(
      :consumer_key => $tokens["fitbit"]["consumer"]["key"],
      :consumer_secret => $tokens["fitbit"]["consumer"]["secret"],
      :token => $tokens["fitbit"]["oauth"]["token"],
      :secret => $tokens["fitbit"]["oauth"]["secret"],
      :unit_system => Fitgem::ApiUnitSystem.METRIC,
    )
  end
end
