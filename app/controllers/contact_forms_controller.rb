class ContactFormsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create] # Allow unauthenticated users to create contact forms

  def create
    @contact_form = ContactForm.new(contact_form_params)

    # Validate the form data
    if @contact_form.valid?
      # Send an email with the form data
      ContactFormMailer.contact_form_email(@contact_form, 'zenmatrixx@yahoo.com').deliver_now

      # Redirect to a new form
      redirect_to new_contact_form_path, notice: 'Your message has been sent successfully.'
    else
      flash.now[:alert] = 'There was an error sending your message. Please try again.'
      render :new
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end
