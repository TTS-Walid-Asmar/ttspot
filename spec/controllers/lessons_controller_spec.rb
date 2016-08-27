require 'rails_helper'

RSpec.describe LessonsController, type: :controller do
  context "when a student is logged in" do
    let(:course) {FactoryGirl.create(:course)}
    let(:student) {FactoryGirl.create(:student)}
    let(:lesson) {FactoryGirl.create(:lesson, course_id: course.id)}

    before do
      sign_in(student)
    end

    describe "access denied" do
      it "#new redirects to root path" do
        get :new, course_id: course.id

        expect(response).to redirect_to root_path
      end

      it "#edit redirects to root path" do
        get :edit, id: lesson

        expect(response).to redirect_to root_path
      end

      it "#create redirects to root path" do
        post :create, course_id: course.id, lesson: FactoryGirl.attributes_for(:lesson)

        expect(response).to redirect_to root_path
      end

      it "#update redirects to root path" do
        lesson_params_hash = FactoryGirl.attributes_for(:lesson, title: "OOP")
        put :update, id: lesson, lesson: lesson_params_hash
        lesson.reload

        expect(lesson.title).to eql("Title")
        expect(response).to redirect_to root_path
      end

      it "#destroy redirects to root path" do
        delete :destroy, id: lesson

        expect(lesson).to be_present
        expect(response).to redirect_to root_path
      end

      it "#show returns http success" do
        get :show, id: lesson

        expect(response).to have_http_status(:success)
      end
    end
  end

  context "when an instructor is logged in" do
    let(:course) {FactoryGirl.create(:course)}
    let(:instructor) {FactoryGirl.create(:instructor)}
    let(:lesson) {FactoryGirl.create(:lesson, course_id: course.id)}

    before do
      sign_in(instructor)
    end

    describe "access granted" do
      it "#new returns http success" do
        get :new, course_id: course.id

        expect(response).to have_http_status(:success)
      end

      it "#show returns http success" do
        get :show, id: lesson

        expect(response).to have_http_status(:success)
      end

      it "#edit returns http success" do
        get :edit, id: lesson

        expect(response).to have_http_status(:success)
      end

      it "#updates successfully" do
        lesson_params_hash = FactoryGirl.attributes_for(:lesson, title: "Winter")
        put :update, id: lesson, lesson: lesson_params_hash
        lesson.reload

        expect(lesson.title).to eql("Winter")
        expect(response).to redirect_to lesson
      end

      it "#destroys successfully" do
        delete :destroy, id: lesson

        expect(response).to redirect_to course
      end
    end
  end
end
