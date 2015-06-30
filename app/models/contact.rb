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
      subject: subject,
      to: "me@fousa.be",
      from: %("#{name}" <#{email}>)
    }
  end

  def subject
    subject = '[FOUSA] Question'
    return subject if type.nil? || type.blank?
    subject + " about #{self.type}"
  end
end
