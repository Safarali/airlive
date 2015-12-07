class PagesController < ApplicationController
  def home
  	@rooms = Room.all
  end

  def how_it_works
  end
end
