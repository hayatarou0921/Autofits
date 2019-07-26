class ShoesController < ApplicationController
  include SetAttributes

  def index
    @shoes = Shoe.where(user_id: current_user.id).page(params[:page]).per(9)
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
      flash.now[:alert] = '画像を選択してください。' 
      render :new
    end
  end

  def destroy
    @shoe = Shoe.where(user_id: current_user.id).find(params[:id])
    destroy_outfits_with_shoes
    @shoe.destroy
    @shoes = Shoe.where(user_id: current_user.id).page(params[:page]).per(9)
    @message = 'シューズと、シューズの含まれたコーデを削除しました。'
  end

  private

    def shoe_params
      params.require(:shoe).permit(:image)
    end

    def destroy_outfits_with_shoes
      if outfits = Outfit.where(user_id: current_user.id).where(shoe_id: @shoe.id)
        outfits.each do |outfit|
          outfit.destroy
        end
      end
    end
end
