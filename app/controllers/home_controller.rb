class HomeController < ApplicationController
  skip_authorization_check
  def index
    @eras = Era.all
    @nations = Nation.all
    @users = User.all
  end
end
