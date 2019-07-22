class ShoesController < ApplicationController
  include SetAttributes
  
  def index
    @shoes = Shoe.all
  end

  def new
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.new(shoe_params)
    set_user_id(@shoe)
    if @shoe.save
      redirect_to shoes_path, notice: 'シューズを追加しました。'
    else
      render :new
    end
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    if outfits = Outfit.where(shoe_id: @shoe.id)
      outfits.each do |outfit|
        outfit.destroy
      end
    end
    @shoe.destroy
    redirect_to shoes_path, notice: 'シューズと、シューズの使われたコーデを削除しました。'
  end

  private
    def shoe_params
      params.require(:shoe).permit(:image)
    end
end
