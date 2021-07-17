class MapController < ApplicationController
  def index
  	@lokasis = Rute.select("id_jalan").uniq
  	# cari angkutakutan yang di lokasi berangkan dan lokasi tujuan
  	@angkutanSource = Rute.select("id_angkutan").where("id_jalan = ?", params[:source])
  	@angkutanDestination = Rute.select("id_angkutan").where("id_jalan = ?", params[:destination])
  	@angkutanSatuJalur = @angkutanSource.where(id_angkutan: @angkutanDestination)
  	@ruteAngkot = []

  	#jika ada angkot yang sama antar lokasi brangkat dan tujuan (ssatu kali naik) tampilkanilkan angkot tersebut
  	if @angkutanSatuJalur.count > 0 
  		@angkutanSatuJalur.each_with_index do |item, index|
        distance = 0.0
        lastLatitude = 0.0
        lastLongitiude = 0.0

        jalur = ''
        @rute = Rute.where("id_angkutan = ?", item.id_angkutan)

        @rute.each_with_index do |item2, index|
          jalur += "#{item2.id_jalan} -> "
          if index == 0
            lastLatitude = item2.latitude
            lastLongitiude = item2.longitude
          else
            distance += distance([lastLatitude, lastLongitiude], [item2.latitude, item2.longitude])
            lastLatitude = item2.latitude
            lastLongitiude = item2.longitude
            if params[:destination] == item2.id_jalan
              break
            end
            #bug note: frans seda -> siliwangi betul, cuman kalo sebaliknya masih salah
          end
        end

  			@ruteAngkot.push("*Pilihan #{index+1} : Naik Angkot #{item.id_angkutan} jarak #{distance.round(2)} KM \njalur = #{jalur}")
		  end
    else
  	#else (jika butuh lebih dari satu kali naik angkot)
  		#cek jalur yang di lewati angkutan yg lewat di tempat asal
  		@angkutanSource.each do |item1|

  			@angkutanRoute = Rute.where("id_angkutan = ?", item1.id_angkutan)
  		   #cek angkot apa saja yg lewat di setiap break point
  		    @angkutanRoute.each do |item2|
  		     #cek apakah ada angkutan yg lewwat tempat tujuan atau tidak
  		       	#@ruteAngkot.push("** Lewat #{item2.id_jalan}")
  		     	@angkutanYangLewatSetiapRUte = Rute.select("id_angkutan, latitude, longitude").where("id_jalan = ?", item2.id_jalan)
  		     	@angkutanYangLewakKeTujuan = @angkutanYangLewatSetiapRUte.where(id_angkutan: @angkutanDestination)
  		     	if @angkutanYangLewakKeTujuan.count > 0 
  		     		@listBemo = ""
  		     		@angkutanYangLewakKeTujuan.each do |item3|
  		     			@listBemo += "#{item3.id_angkutan} ,"
  		     		end
  		     		 @ruteAngkot.push("*Naik Angkot #{item1.id_angkutan}")
  					@ruteAngkot.push("*** Turun di #{item2.id_jalan}, Lalu naik angkot #{@listBemo}")
  					break
  		     	end
  		    end
  		end
 	  end
  end

  # source : https://stackoverflow.com/questions/12966638/how-to-calculate-the-distance-between-two-gps-coordinates-without-using-google-m
  def distance(loc1, loc2)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    (rm * c) / 1000 # Delta in kilometers
  end
end

