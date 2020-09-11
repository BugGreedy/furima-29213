class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.includes(:user)
  end

  def new
    @items = Item.new
  end

  def create # 保存
    Item.create(item_params)
  end
    
  private

  def move_to_index
    redirect_to action: index unless user_signed_in?
  end
  
  def item_params
    params.require(:item).merge(user_id:current_user.id)
  end
end
