class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.type == "Instructor"
        can :manage, :all
      else
        can :manage, Homework, student_id: user.id
        can :read, [Course, Lesson]
      end
  end
end
