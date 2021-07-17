class StudentController < ApplicationController
  def new
  	@lokasis = Rute.select("id_jalan").uniq
  end
end
