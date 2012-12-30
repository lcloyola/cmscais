class SendUpdate
  def self.perform(body)
    url = "http://localhost:7070/items.json"
    header = {:auth_token => "sAFQTVysozBGGQxNPBwz" }

    HTTParty.delay.post(url, :body => body, :header => header)
  end
end

