class TrousersController < ApplicationController
  include SetAttributes
  
  def index
    @trousers = Trouser.where(user_id: current_user.id).page(params[:page]).per(9)
  end

  def new
    @trouser = Trouser.new
  end

  def create
    @trouser = Trouser.new(trouser_params)
    set_user_id(@trouser)
    if @trouser.save
      redirect_to trousers_path, notice: 'ボトムスを追加しました。'
    else
      render :new
    end
  end

  def destroy
    @trouser = Trouser.find(params[:id])
    if outfits = Outfit.where(trouser_id: @trouser.id)
      outfits.each do |outfit|
        outfit.destroy
      end
    end
    @trouser.destroy
    @message = 'ボトムスと、ボトムスの含まれたコーデを削除しました。'
  end

  private
    def trouser_params
      params.require(:trouser).permit(:image)
    end
end
