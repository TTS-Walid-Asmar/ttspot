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
  active true
  city
  offering
 end
end
