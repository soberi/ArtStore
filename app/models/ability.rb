class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.present?    	 
    	if user.admin?
    		can :manage, :all
    	else
    		can :manage, [User, Comment], id: user.id
    		can :read, Product
        can :manage, Order, user_id: user.id
   		end
    end
  end

end
