FactoryGirl.define do
 factory :city do
  name "Raleigh"
 end

 factory :offering do
  title "Full Time Code Immersion"
 end

 factory :course do
  description "Learn to Code. Do Something Big."
  starts Date.today
  ends (Date.today + 30)

  trait :on_going do
    active true
  end

  trait :inactive do
    active false
  end

  season "Summer"
  start_time Time.now
  end_time (Time.now + 3*60*60)
  office_name "HQ Raleigh"
  street_address "310 South Harrington St."
  zip_code 27601
  city
  offering
  instructor
 end

 factory :instructor do
   name "Instructor"
   sequence(:email) {|n| "instructor#{n}@instructor.com"}
   password "password"
   password_confirmation "password"
 end

 factory :student do
   name "Student"
   email "student@student.com"
   password "password"
   password_confirmation "password"
 end

 factory :registration do
  student
  course
 end

 factory :lesson do
   number 1
   title "Title"
   description "Rails"
   entry "Markdown"
   course
   instructor
   public true
 end

 factory :homework do
   link "https://www.github.com"
   student
   lesson
 end
end
