require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #send_email" do
    let(:org) { Organization.create!(name: "Org1", email: "org1@test.com") }
    let(:contact) { Contact.create!(name: "User1", email: "user1@test.com", organization: org) }
    let(:template) { EmailTemplate.create!(subject: "Test", body: "Body") }

    it "redirects to contacts path with notice" do
      post :preview, params: { id: contact.id, template_id: template.id, commit: "send" }
      expect(response).to redirect_to(contacts_path)
      expect(flash[:notice]).to include("Simulated sending")
    end
  end
end
