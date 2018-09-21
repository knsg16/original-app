class CompaniesLoyalty < ApplicationLoyalty
    def create?
        user.authority == 1 || user.authority == 3
    end
    
    def destroy?
        user.authority == 1 || user.authority == 3
    end
    
    def update?
        user.authority == 1 || user.authority == 3
    end
end
