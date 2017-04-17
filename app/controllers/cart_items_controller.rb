class CartItemsController < ApplicationController
  before_action :require_login!

  def create
    album = Album.find_by(id: params[:album_id])
    if album
#add_to_cart method from User model
      current_user.add_to_cart!(album)
      flash[:success] = 'Album added to your cart!'
    else
      flash[:warning] = 'Cannot find such album...'
    end
    redirect_to root_path
  end

  def destroy
    cart_item = CartItem.find_by(id: params[:id])
    if cart_item
#remove_from_cart method from User model
      current_user.remove_from_cart!(cart_item.album)
      flash[:success] = 'The item has been removed!'
    else
      flash[:warning] = 'Cannot remove this item...'
    end
    redirect_to root_path
  end
end
