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
      flash.now[:alert] = '画像を選択してください。' 
      render :new
    end
  end

  def destroy
    @trouser = Trouser.where(user_id: current_user.id).find(params[:id])
    destroy_outfits_with_trouser
    @trouser.destroy
    @trousers = Trouser.where(user_id: current_user.id).page(params[:page]).per(9)
    @message = 'ボトムスと、ボトムスの含まれたコーデを削除しました。'
  end

  private
    def trouser_params
      params.require(:trouser).permit(:image)
    end

    def destroy_outfits_with_trouser
      if outfits = Outfit.where(user_id: current_user.id).where(trouser_id: @trouser.id)
        outfits.each do |outfit|
          outfit.destroy
        end
      end
    end
end
