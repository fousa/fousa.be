class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :captcha, captcha: true

  def headers
    {
      subject: "[FOUSA] Contact",
      to: "me@fousa.be",
      from: %("#{name}" <#{email}>)
    }
  end
end
