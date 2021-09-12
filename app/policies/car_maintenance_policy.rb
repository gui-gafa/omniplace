  class CarMaintenancePolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
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
      (record.car.user == user) || (user.role? :admin)
    end
    def destroy?
      (record.car.user == user) || (user.role? :admin)
    end
  end
    