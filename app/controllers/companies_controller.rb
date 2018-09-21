class CompaniesController < ApplicationController

    def index
        @companies = Company.all
    end
    
    def new
        @company = Company.new
    end
    
    def create
        authorize! 
        @company = Company.new(company_params)
        if @company.save
            flash[:success] = "会社を登録しました"
            redirect_to action: :index
            return
        end
        
        render :new
    end
    
    def destroy
        authorize!
        company = Company.find(params[:id])
        flash[:success] = "「#{company.company_name}」を削除しました" if company.destroy
        redirect_to action: :index
    end
    
    def edit
        @company = Company.find(params[:id])
    end
    
    def update
        authorize!
        @company = Company.find(params[:id])
        if @company.update(company_params)
            flash[:success] = "会社情報を変更しました"
            redirect_to action: :index
            return
        end
        
        render :edit
    end
    
    private
    def company_params
        params.require(:company).permit(
            :company_name, 
            :office_name, 
            :address_prefecture, 
            :address_city, 
            :address_street_number, 
            :address_after, 
            :postcode, 
            :contact_person, 
            :email, 
            :tel)
    end
end
