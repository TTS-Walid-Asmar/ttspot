require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  context "when a student is logged in" do
    let(:course) {FactoryGirl.create(:course)}
    let(:student) {FactoryGirl.create(:student)}

    before do
      sign_in(student)
    end

    describe "access denied" do
      it "#new redirects to root path" do
        get :new

        expect(response).to redirect_to root_path
      end

      it "#edit redirects to root path" do
        get :edit, id: course

        expect(response).to redirect_to root_path
      end

      it "#create redirects to root path" do
        post :create, course: FactoryGirl.attributes_for(:course)

        expect(response).to redirect_to root_path
      end

      it "#update redirects to root path" do
        course_params_hash = FactoryGirl.attributes_for(:course, season: "Winter")
        put :update, id: course, course: course_params_hash
        course.reload

        expect(course.season).to eql("Summer")
        expect(response).to redirect_to root_path
      end

      it "#destroy redirects to root path" do
        delete :destroy, id: course

        expect(course).to be_present
        expect(response).to redirect_to root_path
      end
    end

    describe "access granted" do
      it "#index returns http success" do
        get :index

        expect(response).to have_http_status(:success)
      end

      it "#show returns http success" do
        get :show, id: course

        expect(response).to have_http_status(:success)
      end
    end
  end

  context "when an instructor is logged in" do
    let(:course) {FactoryGirl.create(:course)}
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
        get :show, id: course

        expect(response).to have_http_status(:success)
      end

      it "#index returns http success" do
        get :index

        expect(response).to have_http_status(:success)
      end

      it "#edit returns http success" do
        get :edit, id: course

        expect(response).to have_http_status(:success)
      end

      it "#updates successfully" do
        course_params_hash = FactoryGirl.attributes_for(:course, season: "Winter")
        put :update, id: course, course: course_params_hash
        course.reload

        expect(course.season).to eql("Winter")
        expect(response).to redirect_to course
      end

      it "#destroys successfully" do
        delete :destroy, id: course

        expect(response).to redirect_to courses_path
      end
    end
  end
end
