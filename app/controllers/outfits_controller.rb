class OutfitsController < ApplicationController
  
  include OutfitCheck

  def index
    @outfits = Outfit.all
  end

  def new
    @outfit = Outfit.new
    set_items
  end

  def create
   check_params
    if flash[:alert].nil?
      @outfit = Outfit.new
      set_id_from_params
      set_user_id(@outfit)
      if @outfit.save
        flash.notice = 'コーディネートを追加しました。'
        redirect_to outfits_path 
      end
    else
      redirect_to new_outfit_path
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
    flash[:notice] = 'コーディネートを削除しました。'
    redirect_to outfits_path
  end

end