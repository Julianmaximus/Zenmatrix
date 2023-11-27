class ContactFormMailer < ApplicationMailer
  def contact_form_email(contact_form)
    @contact_form = contact_form

    mail(
      to: 'julianmax0077@gmail.com', # Updated to your email address
      subject: 'New Contact Form Submission', # Updated subject line
      from: 'julianmax6000@gmail.com' # Updated from address
    ) do |format|
      format.text { render plain: contact_form_body }
    end
  end

  private

  def contact_form_body
    <<~HEREDOC
      Name: #{@contact_form.name}
      Email: #{@contact_form.email}
      Message: #{@contact_form.message}
    HEREDOC
  end
end
