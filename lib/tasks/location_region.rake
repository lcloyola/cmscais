namespace :db do
  task :location_region => :environment do
    ## WARNING: this populator assumes empty locations table

    regions = ["Region I (Ilocos Region)",
                "Region II (Cagayan Valley)",
                "Region III (Central Luzon)",
                "Region IV (Southern Tagalog)",
                "Region V (Bicol Region)",
                "Region VI (Western Visayas)",
                "Region VII (Central Visayas)",
                "Region VIII (Eastern Visayas),
                Region IX (Zamboanga Peninsula)",
                "Region X (Northern Mindanao)",
                "Region XI (Davao Region)",
                "Region XII (Socsargen)",
                "Region XIII (Caraga)",
                "National Capital Region (NCR)",
                "ARMM (Autonomous Region in Muslim Mindanao)",
                "CAR (Cordillera Administrative Region)"]
    provinces = [["Ilocos Norte", "Ilocos Sur", "La Union", "Pangasinan"],
                  ["Batanes", "Cagayan", "Isabela", "Nueva Vizcaya", "Quirino"],
                  ["Aurora", "Bataan", "Bulacan", "Nueva Ecija", "Pampanga", "Tarlac", "Zambales"],
                  ["IV-A (Calabarzon)", "IV-B (Mimaropa)"],
                  ["Albay", "Camarines Norte", "Camarines Sur", "Catanduanes", "Masbate", "Sorsogon"],
                  ["Aklan", "Antique", "Capiz", "Guimaras", "Iloilo", "Negros Occidental"],
                  ["Bohol", "Cebu", "Negros Oriental", "Siquijor"],
                  ["Biliran", "Eastern Samar", "Leyte", "Northern Samar", "Western Samar", "Southern Samar"],
                  ["Zamboanga Del Norte", "Zamboanga Del Sur", "Zamboanga Sibugay"],
                  ["Bukidnon", "Camiguin", "Lanao Del Norte", "Misamis Occidental", "Misamis Oriental"],
                  ["Compostela Valley", "Davao Del Norte", "Davao Del Sur", "Davao Oriental"],
                  ["North Cotabato", "Sarangani", "South Cotabato", "Sultan Kudarat"],
                  ["Agusan Del Norte", "Agusan Del Sur", "Surigao Del Norte", "Surigao Del Sur"],
                  ["Caloocan", "Las Pinas", "Makati", "Malabon", "Mandaluyong", "Manila", "Marikina", "Muntinlupa", "Navotas", "Pasay", "Pasig", "Pateros", "Paranaque", "Quezon", "San Juan", "Taguig", "Valenzuela"],
                  ["Basilan", "Lanao Del Sur", "Maguindanao", "Sulu", "Tawi-Tawi"],
                  ["Abra", "Apayao", "Benguet", "Ifugao", "Kalinga", "Mountain Province"]]
    reg4a = ["Batangas", "Cavite", "Laguna", "Quezon", "Rizal"]
    reg4b = ["Marinduque", "Occidental Mindoro", "Oriental Mindoro", "Palawan", "Romblon"]

    regions.each do |r|
      props = {
        name: r,
        longmax: 126.60438370,
        longmin: 116.70291930,
        latmax: 19.57402410,
        latmin: 4.613444299999999
      }
      location = Location.create! props
    end
    i = 1
    provinces.each do |groupofprov|
      groupofprov.each do |p|
        props = {
          name: p,
          longmin: 126.60438370,
          longmax: 116.70291930,
          latmin: 19.57402410,
          latmax: 4.613444299999999
        }
        location = Location.create! props
        subprops ={
          child_id: location.id,
          parent_id: i,
          remarks: "province"
        }
        Sublocation.create! subprops
      end
      i = i + 1
    end
    r4a = Location.find_by_name("IV-A (Calabarzon)")
    r4b = Location.find_by_name("IV-B (Mimaropa)")

    reg4a.each do |p|
      props = {
        name: p,
        longmax: 126.60438370,
        longmin: 116.70291930,
        latmax: 19.57402410,
        latmin: 4.613444299999999
      }
      location = Location.create! props
      subprops ={
        child_id: location.id,
        parent_id: r4a.id,
        remarks: "province"
      }
      Sublocation.create! subprops
    end
    reg4b.each do |p|
      props = {
        name: p,
        longmax: 126.60438370,
        longmin: 116.70291930,
        latmax: 19.57402410,
        latmin: 4.613444299999999
      }
      location = Location.create! props
      subprops ={
        child_id: location.id,
        parent_id: r4b.id,
        remarks: "province"
      }
      Sublocation.create! subprops
    end

  end
end

