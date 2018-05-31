class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.present?    	 
    	if user.admin?
    		can :manage, :all
    	else
    		can :manage, [User, Comment, Order], id: user.id
    		can :read, Product
   		end
    end
  end

end
