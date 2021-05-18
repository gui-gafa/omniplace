  class ExpensePolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        if user.role? :admin
          scope.all
        else
          scope.where(user: user)
        end
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
    