class LandingController < ApplicationController

  #layout "landing_layout"

  def index
    @message = Message.new
    @messages = Message.all
  end
end
