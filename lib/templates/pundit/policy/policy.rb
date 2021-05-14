<% module_namespacing do -%>
  class <%= class_name %>Policy < ApplicationPolicy
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
      user.role? :admin
    end
    def update?
      user.role? :admin 
    end
    def destroy?
      user.role? :admin
    end
  end
  <% end -%>
  