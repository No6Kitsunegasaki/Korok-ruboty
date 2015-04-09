class AbstractRandomPostModel < AbstractModel
  @@sentenses = []
  def self.choice
    @@sentenses.sample
  end
end
