class ItemsLoyalty < ApplicationLoyalty
    def create?
        user.authority == 1 || user.authority == 4
    end
    
    def destroy?
        user.authority == 1 || user.authority == 4
    end
    
    def update?
        user.authority == 1 || user.authority == 4
    end
end
