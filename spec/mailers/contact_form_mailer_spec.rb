# spec/mailers/contact_form_mailer_spec.rb
require "rails_helper"

RSpec.describe ContactFormMailer, type: :mailer do
  describe 'contact_form_email' do
    let(:contact_form) { ContactForm.new(name: 'Test User', email: 'test@example.com', message: 'Hello!') }
    let(:mail) { ContactFormMailer.contact_form_email(contact_form) }

    it 'renders the headers' do
      expect(mail.subject).to eq('New Contact Form Submission')
      expect(mail.to).to eq(['julianmax0077@gmail.com'])
      expect(mail.from).to eq(['julianmax6000@gmail.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Name: Test User')
      expect(mail.body.encoded).to match('Email: test@example.com')
      expect(mail.body.encoded).to match('Message: Hello!')
    end
  end
end
