# frozen_string_literal: true

class AdminMailer < ApplicationMailer

  def contact_email(name, subject, email, message)
    @name = name
    @subject = subject
    @client_email =email
    @message = message
    mail(to: "my.email@gmail.com", from: @client_email, subject: 'Contact information')
  end
end