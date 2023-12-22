# spec/requests/contact_forms_request_spec.rb
require 'rails_helper'

RSpec.describe "ContactForms", type: :request do
  describe 'POST /create' do
    it 'sends an email' do
      expect do
        post contact_forms_path,
             params: { contact_form: { name: 'Test User', email: 'test@example.com', message: 'Hello!' } }
      end.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it 'redirects to the new contact form' do
      post contact_forms_path,
           params: { contact_form: { name: 'Test User', email: 'test@example.com', message: 'Hello!' } }
      expect(response).to redirect_to(new_contact_form_path)
    end
  end
end
