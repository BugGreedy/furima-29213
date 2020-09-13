class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create # 保存
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
       render :new
    end
  end
    
  private

  def move_to_index
    unless user_signed_in?
     redirect_to root_path
    end
  end
  
  def item_params
    params.require(:item).permit(:image, :name, :text, :genre_id, :condition_id, :shipping_charge_id, :shipping_date_id, :shipping_place_id, :price ).merge(user_id:current_user.id)
  end
end
