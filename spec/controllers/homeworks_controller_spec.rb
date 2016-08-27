require 'rails_helper'

RSpec.describe HomeworksController, type: :controller do
  let(:student_who_uploaded_hw) {FactoryGirl.create(:student, email: "stu@stu.com")}
  let(:different_student) {FactoryGirl.create(:student, email: "another1@stu.com")}
  let(:lesson) {FactoryGirl.create(:lesson)}
  let(:homework) {FactoryGirl.create(:homework, student: student_who_uploaded_hw)}

  context "when editing their homewok submission" do
    before do
      sign_in(student_who_uploaded_hw)
    end

    it "#update" do
      homework = FactoryGirl.create(:homework)
      homework_params_hash = FactoryGirl.attributes_for(:homework, link: "bitbucket.com")
      put :update, lesson_id: lesson, id: homework, homework: homework_params_hash
      homework.reload

      expect(homework.link).to eql("bitbucket.com")
      expect(response).to redirect_to lesson
    end

    it "#destroy" do
      homework = FactoryGirl.create(:homework)

      expect{delete :destroy, lesson_id: lesson, id: homework}.to change(Homework, :count).by(-1)
      expect(response).to redirect_to lesson
    end
  end

  context "when trying to edit another student's hw submission" do
    before do
      sign_in(different_student)
    end

    it "#update" do
      homework = FactoryGirl.create(:homework)
      homework_params_hash = FactoryGirl.attributes_for(:homework, link: "bitbucket.com")
      put :update, lesson_id: lesson, id: homework, homework: homework_params_hash
      homework.reload

      expect(homework.link).to eql("https://www.github.com")
      expect(response).to redirect_to root_path
    end

    it "#destroy" do
      homework = FactoryGirl.create(:homework)

      expect(homework).to be_present
      expect(response).to redirect_to root_path
    end
  end
end
