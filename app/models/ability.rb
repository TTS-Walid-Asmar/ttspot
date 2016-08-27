class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.type == "Instructor"
        can :manage, :all
      elsif user.type == "Student"
        can :read, [Course, Lesson, Homework]
        can :manage, Homework, student_id: user.id
      end
  end
end
