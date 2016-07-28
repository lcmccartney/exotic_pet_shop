class CartAnimalsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
  end

  def create
    animal = Animal.find(params[:animal_id])
    @cart.add_animal(animal.id)
    session[:cart] = @cart.contents
    flash[:success] = "#{pluralize(@cart.count_of(animal.id), animal.name)} in your cart"
    redirect_to animal_path(animal)
  end

  def destroy
    animal = Animal.find(params[:id])
    @cart.remove_animal(animal.id)
    link = %Q[<a href="/animals/#{animal.id}">#{animal.name}</a>]
    flash[:success] = "Successfully removed #{link} from your cart."
    redirect_to cart_path
  end

  def update
    animal = Animal.find(params[:id])
    @cart.add_animal(animal.id)
    flash[:success] = "Successfully added #{animal.name}!"
    redirect_to cart_path
  end
end
