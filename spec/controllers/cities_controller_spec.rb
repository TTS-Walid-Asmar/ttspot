require 'rails_helper'

RSpec.describe CitiesController, type: :controller do

  context "when a student is logged in" do
    let(:student) {FactoryGirl.create(:student)}
    let(:city) {FactoryGirl.create(:city)}

    before do
      sign_in(student)
    end

    describe "access denied" do
      it "#new redirects to root path" do
        get :new

        expect(response).to redirect_to root_path
      end

      it "#edit redirects to root path" do
        get :edit, id: city

        expect(response).to redirect_to root_path
      end

      it "#create redirects to root path" do
        post :create, city: FactoryGirl.attributes_for(:city)

        expect(response).to redirect_to root_path
      end

      it "#update redirects to root path" do
        city_params_hash = FactoryGirl.attributes_for(:city, name: "Charlotte")
        put :update, id: city, city: city_params_hash
        city.reload

        expect(city.name).to eql("Raleigh")
        expect(response).to redirect_to root_path
      end

      it "#destroy redirects to root path" do
        delete :destroy, id: city

        expect(city).to be_present
        expect(response).to redirect_to root_path
      end

      it "#index redirects to root path" do
        get :index

        expect(response).to redirect_to root_path
      end

      it "#show redirects to root path" do
        get :show, id: city

        expect(response).to redirect_to root_path
      end
    end
  end

  context "when an instructor is logged in" do
    let(:city) {FactoryGirl.create(:city)}
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
        get :show, id: city

        expect(response).to have_http_status(:success)
      end

      it "#index returns http success" do
        get :index

        expect(response).to have_http_status(:success)
      end

      it "#edit returns http success" do
        get :edit, id: city

        expect(response).to have_http_status(:success)
      end

      it "#updates successfully" do
        city_params_hash = FactoryGirl.attributes_for(:city, name: "Charlotte")
        put :update, id: city, city: city_params_hash
        city.reload

        expect(city.name).to eql("Charlotte")
        expect(response).to redirect_to city
      end

      it "#destroys successfully" do
        delete :destroy, id: city

        expect(response).to redirect_to cities_path
      end
    end
  end
end
