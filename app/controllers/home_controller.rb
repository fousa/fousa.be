class HomeController < ApplicationController
  def show
    @apps = App.all
  end
end
