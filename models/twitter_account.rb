class TwitterAccountModel < AbstractModel
  def self.get
    Twitter::REST::Client.new do |config|
      config.consumer_key = $tokens["twitter"]["consumer"]["key"]
      config.consumer_secret = $tokens["twitter"]["consumer"]["secret"]
      config.access_token = $tokens["twitter"]["access"]["key"]
      config.access_token_secret = $tokens["twitter"]["access"]["secret"]
    end
  end
end
