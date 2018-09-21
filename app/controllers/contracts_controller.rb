class ContractsController < ApplicationController
    def index
        @contracts = Contract.with_company_and_plan
    end
    
    def new
        @contract = Contract.new
    end
    
    def create
        authorize!
        @contract = Contract.new(
                        company_id:      contract_params[:company_id], 
                        plan_id:         contract_params[:plan_id],
                        applicated_date: contract_params[:applicated_date],
                        start_date:      calc_start_date(contract_params[:applicated_date].to_date))
                        
        if @contract.save 
            flash[:success] = "契約を登録しました"
            redirect_to action: :index
            return
        end
        
        render :new
    end
    
    def destroy
        authorize!
        contract = Contract.find(params[:id])
        flash[:success] = "削除完了しました" if contract.destroy
        redirect_to action: :index
    end
 
    def edit
        @contract = Contract.with_company_and_plan.find(params[:id])
    end
    
    def update
        authorize!
        @contract = Contract.find(params[:id])
        if @contract.update(contract_params)
            flash[:success] = "契約を変更しました"
            redirect_to action: :index
            return
        end
        
        render :edit
    end
    
    def cancel
        authorize!
        contract = Contract.find(params[:id])
        contract.update(end_date: Date.today.next_month.end_of_month)
        flash[:success] = "契約を終了しました"
        redirect_to action: :index
    end
    
    private
    def contract_params
        params.require(:contract).permit(:company_id, :plan_id,:applicated_date, :start_date, :end_date)
    end
    
    def calc_start_date(applicated_date)
        return nil unless applicated_date.present? 
        next_month =  applicated_date.next_month.beginning_of_month
        in_two_months = applicated_date.next_month.next_month.beginning_of_month
        applicated_date.day <= 20 ? next_month : in_two_months
    end
end
