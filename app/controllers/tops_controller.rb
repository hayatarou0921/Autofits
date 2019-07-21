class TopsController < ApplicationController
  def index
    @tops = Top.all
  end

  def new
    @top = Top.new
  end

  def create
    @top = Top.new(top_params)
    @top.user_id = current_user.id
    if @top.save
      redirect_to tops_path, notice: 'トップスを追加しました。'
    else
      render :new
    end
  end

  def destroy
    @top = Top.find(params[:id])
    @top.destroy
    redirect_to tops_path, notice: 'トップスを削除しました。'
  end

  private
    def top_params
      params.require(:top).permit(:image)
    end
end
