class ShoesController < ApplicationController
  def index
    @shoes = Shoe.all
  end

  def new
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.new(shoe_params)
    if @shoe.save
      redirect_to shoes_path, notice: 'トップスを追加しました。'
    else
      render :new
    end
  end

  private
    def shoe_params
      params.require(:shoe).permit(:image)
    end
end
