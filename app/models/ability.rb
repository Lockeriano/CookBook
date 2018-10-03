class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, User
    can :read, Recipe # permissions for every user, even if not logged in
    if user.present?  # additional permissions for logged in users (they can manage their posts)
      can :manage, Recipe, user_id: user.id
      can [:read, :update], User, id: user.id
      if user.admin?  # additional permissions for administrators
        can :manage, :all
      end
    end
  end
end
