class TopsController < ApplicationController
  include SetAttributes
  def index
    @tops = Top.all
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
      render :new
    end
  end

  def destroy
    @top = Top.find(params[:id])
    if outfits = Outfit.where(top_id: @top.id)
      outfits.each do |outfit|
        outfit.destroy
      end
    end
    @top.destroy
    @message = 'トップスと、トップスの含まれたコーデを削除しました。'
  end

  private
    def top_params
      params.require(:top).permit(:image)
    end
end
