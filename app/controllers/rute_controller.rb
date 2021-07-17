class RuteController < ApplicationController
  def index
  	@lokasis = Lokasis.all
  end
end
