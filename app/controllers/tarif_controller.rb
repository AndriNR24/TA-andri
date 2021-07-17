class TarifController < ApplicationController
  def index
  	@lokasis = Rute.select("id_jalan").uniq
  end
end
