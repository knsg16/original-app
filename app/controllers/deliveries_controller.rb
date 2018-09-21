class DeliveriesController < ApplicationController
    def index
        @search = params[:search]
        @deliveries = Delivery.eager_load(:contract, :delivery_items, :items, { contract: :company })
                              .order("schedule_date ASC")
                              .search(params[:search])
        @items = Item.all.each_with_object(Hash.new) { |item, hash| hash[item.id] = item.name }
    end
    
    def new
        @delivery = Delivery.new
        @items = Item.all
        @items.length.times { @delivery.delivery_items.build }
        @contracts = Contract.with_company
    end
    
    def create
        authorize!
        @delivery = Delivery.new(delivery_params)

        #1配送の納品個数の合計が契約プランの1配送の上限納品個数を超えていないかをチェック
        amount = Delivery.calc_amount(delivery_params)
        limit = @delivery.calc_once_quantity_limit
    
        if  limit > amount && @delivery.save 
            flash[:success] = "スケジュールを登録しました"
            redirect_to action: :index
            return #createメソッドから抜ける
        end
        
        @delivery.errors.add(:amount, "の1回あたりの上限納品数を超えています。商品数の合計を#{limit}以下にしてください。") if limit <= amount
        @items = Item.all
        @contracts = Contract.with_company
        render :new   
    end
    
    def destroy
        authorize!
        delivery = Delivery.find(params[:id])
        flash[:success] = "削除しました" if delivery.destroy
        redirect_to action: :index
    end
    
    def edit
        @contracts = Contract.with_company
        @delivery = Delivery.find(params[:id])
        @items = Item.all
    end
    
    def update
        authorize!
        @delivery = Delivery.find(params[:id])
        
        amount = Delivery.calc_amount(update_delivery_params)
        limit = @delivery.calc_once_quantity_limit
        
        if limit > amount && @delivery.update(update_delivery_params)
            flash[:success] = "変更しました"
            redirect_to action: :index
            return
        end
        
        @delivery.errors.add(:amount, "の1回あたりの上限納品数を超えています。商品数の合計を#{limit}以下にしてください。") if limit <= amount
        render :edit
    end
    
    def maintenanced
        authorize!
        delivery = Delivery.find(params[:id])
        delivery.update(maintenanced_at: DateTime.now)
        redirect_to action: :index
    end
    
    private
    def delivery_params 
        params.require(:delivery).permit(:contract_id, :schedule_date, delivery_items_attributes: [:item_id, :amount])
    end
    
    def update_delivery_params 
        params.require(:delivery).permit(:contract_id, :schedule_date, delivery_items_attributes: [:item_id, :amount, :_destroy, :id])
    end
    
end
