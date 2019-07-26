class TopsController < ApplicationController
  include SetAttributes

  def index
    @tops = Top.where(user_id: current_user.id).page(params[:page]).per(9)
  end

  def new
    @top = Top.new
  end

  def create
    @top = Top.new(top_params)
    set_user_id(@top)
    if @top.save
      redirect_to tops_path, notice: 'トップスを追加しました。'
    else
      flash.now[:alert] = '画像を選択してください。' 
      render :new
    end
  end

  def destroy
    @top = Top.find(params[:id])
    #トップスの含まれたコーデを一緒に削除
    destroy_outfits_with_tops
    @top.destroy
    #Ajaxに渡すインスタンス変数
    @tops = Top.where(user_id: current_user.id).page(params[:page]).per(9)
    @message = 'トップスと、トップスの含まれたコーデを削除しました。'
  end

  private
    def top_params
      params.require(:top).permit(:image)
    end

    def destroy_outfits_with_tops
      if outfits = Outfit.where(user_id: current_user.id).where(top_id: @top.id)
        outfits.each do |outfit|
          outfit.destroy
        end
      end
    end
end
