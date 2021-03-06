class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      rendar :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      rendar :edit
    end
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :name, :text, :genre_id, :condition_id, :shipping_charge_id, :shipping_date_id, :shipping_place_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
