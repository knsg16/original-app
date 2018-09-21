require 'rails_helper'

describe ItemsController do
    login_user
    describe 'GET #index' do
        it "正しいViewに遷移する" do
            get :index
            expect(response).to render_template :index
        end
        
        it "@itemsが正しい値を持つ" do
            items = create_list(:item, 3)
            get :index
            expect(assigns(:items)).to match(items)
        end
    end
    
    describe 'DELETE #destroy' do
        it "DBからitemが削除される" do
            item = create(:item)
            expect do
                delete :destroy, id: item
            end.to change(Item, :count).by(-1)
        end
    end
        
    
    describe 'POST #create' do
        context "@itemが正常に登録できた場合" do
            it "DBに値が保存される" do
                expect do
                    post :create, item: attributes_for(:item)
                end.to change(Item, :count).by(1)
            end
            
            it "indexのviewに遷移する" do
                post :create, item: attributes_for(:item)
                expect(response).to redirect_to("/items") 
            end
        end
        context "@itemが登録できなかった場合" do
            it "DBに値が保存されない" do
                expect do
                    post :create, item: attributes_for(:item, name: nil, price: nil)
                end.to change(Item, :count).by(0)
            end
            it "newのviewに遷移する" do
                post :create, item: attributes_for(:item, name: nil, price: nil)
                expect(response).to render_template :new
            end
        end
    end
    
    describe 'PATCH #update' do
        context "@itemを正常に更新できた場合" do
            it "@itemが正しい値を持つ" do
                item = create(:item)
                patch :update, id: item, item: attributes_for(:item)
                expect(assigns(:item)).to eq item
            end
            
            it "@itemが正しく更新できる" do
                item = create(:item)
                patch :update, id: item, item: attributes_for(:item, name: '目玉焼き', price: '1000')
                item.reload
                expect(item.name).to eq "目玉焼き"
                expect(item.price).to eq 1000
            end
            
            it "indexのviewに遷移する" do
                item = create(:item)
                patch :update, id: item, item: attributes_for(:item, name: '目玉焼き', price: '1000')
                item.reload
                expect(response).to redirect_to("/items")
            end
        end
        
        context "@itemを更新できなかった場合" do
            it "@itemが更新されていない" do
                item = create(:item)
                patch :update, id: item, item: attributes_for(:item, name: '目玉焼き', price: '')
                item.reload
                expect(assigns(:item)).to eq item
            end
            
            it "editのviewに遷移する" do
                item = create(:item)
                patch :update, id: item, item: attributes_for(:item, name: '目玉焼き', price: '')
                item.reload
                expect(response).to render_template :edit
            end
        end
    end
    
    describe 'GET #edit' do
        it "editのviewに遷移する" do
            item = create(:item)
            get :edit, id: item, item: attributes_for(:item)
            expect(assigns(:item)).to eq item
        end
    end
end
