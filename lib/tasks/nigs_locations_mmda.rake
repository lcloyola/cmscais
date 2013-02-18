namespace :nigs do
  task :locations_mmda => :environment do
    File.open("#{Rails.public_path}/mmda.txt", "r").each_line do |line|
      data = line.gsub("-","")
      data = data.gsub(" ","+")
      data = data.gsub("\n","")
      @result = JSON.parse HTTParty.get(URI.encode("http://maps.googleapis.com/maps/api/geocode/json?address=#{data}&sensor=false")).response.body
      @result["results"].each do |r|
        unless r.empty?
          if Location.find_by_name(r["formatted_address"]).nil? && r.has_key?("geometry")
            poi = Location.new
            poi["name"] = r["formatted_address"]
            if r["geometry"].has_key?("bounds")
              poi["latmax"] = r["geometry"]["bounds"]["northeast"]["lat"]
              poi["longmax"] = r["geometry"]["bounds"]["northeast"]["lng"]
              poi["latmin"] = r["geometry"]["bounds"]["southwest"]["lat"]
              poi["longmin"] = r["geometry"]["bounds"]["southwest"]["lng"]
            elsif r["geometry"].has_key?("location")
              puts r["geometry"]["location"]
              poi["latmax"] = r["geometry"]["location"]["lat"]
              poi["longmax"] = r["geometry"]["location"]["lng"]
              poi["latmin"] = r["geometry"]["location"]["lat"]
              poi["longmin"] = r["geometry"]["location"]["lng"]
            else
              poi["latmax"] = 19.57402410
              poi["longmax"] = 126.60438370
              poi["latmin"] = 4.613444299999999
              poi["longmin"] = 116.70291930
            end
            poi["iprange"] = "192.168.2.0/24"
            poi.save
          end
        end

     end
    end
  end
end