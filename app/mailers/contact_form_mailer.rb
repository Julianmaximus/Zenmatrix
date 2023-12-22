class ContactFormMailer < ApplicationMailer
  def contact_form_email(contact_form, email)
    @contact_form = contact_form
    mail(to: email, subject: 'New Contact Form Submission')
  end
end
