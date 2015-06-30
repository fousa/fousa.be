class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :type
  attribute :captcha, captcha: true

  def self.types
    App.all.map { |a| ContactsController.helpers.format_app_name a }
  end

  def headers
    {
      subject: "[FOUSA] Contact",
      to: "me@fousa.be",
      from: %("#{name}" <#{email}>)
    }
  end
end
