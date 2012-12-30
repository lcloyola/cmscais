class SendUpdate
  def self.perform(body, header, url)
    url = "http://localhost:7070/items.json"
    HTTParty.delay.post(url, :body => body, :header => header)
  end
end

