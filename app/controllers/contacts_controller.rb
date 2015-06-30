class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    @delivered = @contact.deliver
    respond_to do |format|
      format.js
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :captcha)
  end
end
