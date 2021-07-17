class ApplicationController < ActionController::Base
	 @lokasis = Rute.select("id_jalan").uniq
end
