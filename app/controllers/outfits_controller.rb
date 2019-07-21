class OutfitsController < ApplicationController
  def index
    @outfits = Outfit.all
  end

  def new
    @outfit = Outfit.new
    @tops = Top.all
    @trousers = Trouser.all
    @shoes = Shoe.all
  end

  def create
    @outfit = Outfit.new
    @outfit.top_id = params[:outfit][:top]
    @outfit.trouser_id = params[:outfit][:trouser]
    @outfit.shoe_id = params[:outfit][:shoe]
    @outfit.user_id = current_user.id
    if @outfit.save
      redirect_to outfits_path
    end
  end

  def show
    @outfit = Outfit.find(params[:id])
  end

  def edit
    @outfit = Outfit.find(params[:id])
  end

  def update
    @outfit = Outfit.find(params[:id])
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    redirect_to outfits_path
  end

end