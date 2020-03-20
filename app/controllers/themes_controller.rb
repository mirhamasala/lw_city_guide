class ThemesController < ApplicationController
skip_before_action :authenticate_user!

  def update
    cookies[:theme] = cookies[:theme] == "dark" ? "light" : "dark"
    redirect_back(fallback_location: root_path)
  end
end

# Concept - RESTful routes + RESTful controller
# Using resources, which are nouns
# Rails way of doing restful - 5,6 actions you can do to a resource, index, new, create, etc. and you should only use those action ... set_theme isn't restful

# What would you have to do if you have a third theme
# !
