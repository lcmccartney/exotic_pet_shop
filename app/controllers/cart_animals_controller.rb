class CartAnimalsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    animal = Animal.find(params[:animal_id])
    @cart.add_animal(animal.id)
    session[:cart] = @cart.contents
    flash[:notice] = "#{pluralize(@cart.count_of(animal.id), animal.name)} in your cart"
    redirect_to animal_path(animal)
  end

  def index
  end

  def destroy
    animal = Animal.find(params[:id])
    @cart.remove_animal(animal.id)
    a = %Q[<a href="/animals/#{animal.id}">#{animal.name}</a>]
    flash[:notice] = "Successfully removed #{a} from your cart."
    redirect_to cart_path
  end
end
