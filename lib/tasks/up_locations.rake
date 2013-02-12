namespace :nigs do
  task :locations => :environment do
    File.open("#{Rails.public_path}/pois.txt", "r").each_line do |line|
      data = line.gsub("-","")
      data = data.gsub(" ","+")
      data = data.gsub("\n"," UP+Diliman")
      @result = JSON.parse HTTParty.get(URI.encode("http://maps.googleapis.com/maps/api/geocode/json?address=#{data}&sensor=false")).response.body
      puts "yey parsed"
      @result["results"].each do |r|
        unless r.empty?
          puts "yey present"
          if Location.find_by_name(r["formatted_address"]).nil? && r.has_key?("geometry")
            poi = Location.new
            poi["name"] = r["formatted_address"]
            if r["geometry"].has_key?("bounds")
              puts "bounds"
              poi["latmax"] = r["geometry"]["bounds"]["northeast"]["lat"]
              poi["longmax"] = r["geometry"]["bounds"]["northeast"]["lng"]
              poi["latmin"] = r["geometry"]["bounds"]["southwest"]["lat"]
              poi["longmin"] = r["geometry"]["bounds"]["southwest"]["lng"]
            elsif r["geometry"].has_key?("location")
              puts r["geometry"]["location"]
              poi["latmax"] = r["geometry"]["location"]["lat"]
              poi["longmax"] = r["geometry"]["location"]["lng"]
              puts "oo"
              poi["latmin"] = r["geometry"]["location"]["lat"]
              poi["longmin"] = r["geometry"]["location"]["lng"]
            else
              poi["latmax"] = 19.57402410
              poi["longmax"] = 126.60438370
              poi["latmin"] = 4.613444299999999
              poi["longmin"] = 116.70291930

              puts "bb"
            end
            puts "Ccc"
            poi["iprange"] = "192.168.2.0/24"
            poi.save
            puts "ddd"
          end
        end
     end
    end
  end
end