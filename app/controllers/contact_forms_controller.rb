class ContactFormsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create] # Allow unauthenticated users to create contact forms

  def create
    @contact_form = ContactForm.new(contact_form_params)

    # Validate the form data
    if @contact_form.valid?
      # Send an email with the form data
      ContactFormMailer.contact_form_email(@contact_form).deliver_now

      # Redirect to a new form
      redirect_to new_contact_form_path
    else
      render :new
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end
