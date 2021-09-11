  class CarPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.where(user: user)
      end
    end
    # New and edit não são necessários pois são desenvolvidos no applications controller
    def show?
      true
    end 
    def create?
      true
    end
    def update?
      record.user == user
    end
    def destroy?
      record.user == user
    end
  end
    