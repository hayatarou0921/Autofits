class TopsController < ApplicationController
  def index
    @tops = Top.all
  end

  def new
    @top = Top.new
  end

  def create
    @top = Top.new(top_params)
    if @top.save
      redirect_to tops_path, notice: 'トップスを追加しました。'
    else
      render :new
    end
  end

  private
    def top_params
      params.require(:top).permit(:image)
    end
end
