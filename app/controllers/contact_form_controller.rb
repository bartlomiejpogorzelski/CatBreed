class ContactFormController < ApplicationController

  def new
    render Contact::NewComponent.new
  end

  def create
    @name = params[:contact_form][:name]
    @subject = params[:contact_form][:subject]
    @email = params[:contact_form][:email]
    @message = params[:contact_form][:message]

    AdminMailer.contact_email(@name, @subject, @email, @message).deliver_now
    # flash[:success] = "Your message has been sent successfully."
    render HomeComponent.new
end

end
