class ShoesController < ApplicationController
  def index
    @shoes = Shoe.all
  end

  def new
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.new(shoe_params)
    @shoe.user_id = current_user.id
    if @shoe.save
      redirect_to shoes_path, notice: 'トップスを追加しました。'
    else
      render :new
    end
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    if outfit = Outfit.find_by(shoe_id: @shoe.id)
      outfit.destroy
    end
    @shoe.destroy
    redirect_to shoes_path, notice: 'シューズを一足削除しました。'
  end

  private
    def shoe_params
      params.require(:shoe).permit(:image)
    end
end
