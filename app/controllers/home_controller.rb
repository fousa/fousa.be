class HomeController < ApplicationController
  def show
    @apps = App.all
    @contact = Contact.new
  end
end
