class PlansController < ApplicationController
    def index
        @plans = Plan.all
    end
    
    def new
        @plan = Plan.new
    end
    
    def create
        authorize!
        @plan = Plan.new(plan_params)
        if @plan.save
            flash[:success] = "プランを登録しました"
            redirect_to action: :index
            return
        end
        
        render :edit
    end
    
    def destroy
        authorize!
        plan = Plan.find(params[:id])
        flash[:success] = "「#{plan.name}」を削除しました" if plan.destroy
        redirect_to action: :index
    end
    
    def edit
        @plan = Plan.find(params[:id])
    end
    
    def update
        authorize!
        @plan = Plan.find(params[:id])
        if @plan.update(plan_params)
            flash[:success] = "変更しました"
            redirect_to action: :index
            return
        end
        
        render :edit
    end
    
    private
    def plan_params
        params.require(:plan).permit(
            :name, 
            :price, 
            :month_quantity_limit,
            :month_delivery_limit,
            :once_quantity_limit)
    end
end
