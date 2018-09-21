class DeliveriesLoyalty < ApplicationLoyalty
    def create?
        user.authority == 1 || user.authority == 2
    end
    
    def destroy?
        user.authority == 1 || user.authority == 2
    end
    
    def update?
        user.authority == 1 || user.authority == 2
    end
    
    def maintenanced?
        user.authority == 1 || user.authority == 2
    end
end
