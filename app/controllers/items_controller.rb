class ItemsController < ApplicationController
    def index
        @items = Item.all
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        authorize! 
        if @item.save
            flash[:success] = "商品を登録しました"
            redirect_to action: :index
            return
        end
        
        render :new
    end
    
    def destroy
        authorize! 
        item = Item.find(params[:id])
        flash[:success] = "「#{item.name}」を削除しました" if item.destroy
        redirect_to action: :index
    end
    
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        authorize! 
        @item = Item.find(params[:id])
        if @item.update(item_params)
            flash[:success] = "商品を変更しました"
            redirect_to action: :index
            return
        end
        
        render :edit
    end
    
    private
    def item_params
        params.require(:item).permit(:name, :price)
    end
end
