class LandingController < ApplicationController
  before_action :authenticate_user!

  layout "landing_layout"

  def index
    @message = Message.new
  end
end
