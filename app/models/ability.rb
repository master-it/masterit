class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
    elsif user.role? :manager#Кураторор
      can :read, :all
      can :manage, WorkNomination
      can :manage, Work do |work|
      end
      can :manage, Competition
      can :manage, Tour 
    elsif user.role? :expert
      can :manage, Work
      can :manage, Competition
      can :manage, Basket
    elsif user.role? :participant
      can :read, :all
    end
  end
end
