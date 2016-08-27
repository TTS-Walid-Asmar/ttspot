require 'rails_helper'

RSpec.describe OfferingsController, type: :controller do

  context "when a student is logged in" do
    let(:student) {FactoryGirl.create(:student)}
    let(:offering) {FactoryGirl.create(:offering)}

    before do
      sign_in(student)
    end

    describe "access denied" do
      it "#new redirects to root path" do
        get :new

        expect(response).to redirect_to root_path
      end

      it "#edit redirects to root path" do
        get :edit, id: offering

        expect(response).to redirect_to root_path
      end

      it "#create redirects to root path" do
        post :create, offering: FactoryGirl.attributes_for(:offering)

        expect(response).to redirect_to root_path
      end

      it "#update redirects to root path" do
        offering_params_hash = FactoryGirl.attributes_for(:offering, title: "JS")
        put :update, id: offering, offering: offering_params_hash
        offering.reload

        expect(offering.title).to eql("Full Time Code Immersion")
        expect(response).to redirect_to root_path
      end

      it "#destroy redirects to root path" do
        delete :destroy, id: offering

        expect(offering).to be_present
        expect(response).to redirect_to root_path
      end

      it "#index redirects to root path" do
        get :index

        expect(response).to redirect_to root_path
      end

      it "#show redirects to root path" do
        get :show, id: offering

        expect(response).to redirect_to root_path
      end
    end
  end

  context "when an instructor is logged in" do
    let(:offering) {FactoryGirl.create(:offering)}
    let(:instructor) {FactoryGirl.create(:instructor)}

    before do
      sign_in(instructor)
    end

    describe "access granted" do
      it "#new returns http success" do
        get :new

        expect(response).to have_http_status(:success)
      end

      it "#show returns http success" do
        get :show, id: offering

        expect(response).to have_http_status(:success)
      end

      it "#index returns http success" do
        get :index

        expect(response).to have_http_status(:success)
      end

      it "#edit returns http success" do
        get :edit, id: offering

        expect(response).to have_http_status(:success)
      end

      it "#updates successfully" do
        offering_params_hash = FactoryGirl.attributes_for(:offering, title: "PT")
        put :update, id: offering, offering: offering_params_hash
        offering.reload

        expect(offering.title).to eql("PT")
        expect(response).to redirect_to offering
      end

      it "#destroys successfully" do
        delete :destroy, id: offering

        expect(response).to redirect_to offerings_path
      end
    end
  end
end
