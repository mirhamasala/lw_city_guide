class ThemesController < ApplicationController
  skip_before_action :authenticate_user!

  def update
    cookies[:theme] = cookies[:theme] == "dark" ? "light" : "dark"
    redirect_back(fallback_location: root_path)
  end
end
