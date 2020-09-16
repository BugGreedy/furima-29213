class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  # def index
  #   @item = Item.find(params[:item_id])
  # end


  private
  

  def set_item
    @item = Item.find(params[:item_id])
  end


end
