require "rails_helper"

RSpec.describe "items/index" do
  it "商品の名前の表示が行える" do
    @item = build(:item)
    @item2 = build(:item, name: '卵焼き', price: "100")
    
    @items = [@item, @item2]
    
    render 
    assert_select 'tr>td', text: @item.name.to_s, count: 1
  end
end