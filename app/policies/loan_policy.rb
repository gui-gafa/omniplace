  class LoanPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.where(provider: user).or(scope.where(taker: user))
      end
    end
    # New and edit não são necessários pois são desenvolvidos no applications controller
    def show?
      true
    end 
    def create?
      user.role? :admin
    end
    def update?
      user.role? :admin 
    end
    def destroy?
      user.role? :admin
    end
  end
    