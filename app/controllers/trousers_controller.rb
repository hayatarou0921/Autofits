class TrousersController < ApplicationController
  def index
    @trousers = Trouser.all
  end

  def new
    @trouser = Trouser.new
  end

  def create
    @trouser = Trouser.new(trouser_params)
    @trouser.user_id = current_user.id
    if @trouser.save
      redirect_to trousers_path, notice: 'トップスを追加しました。'
    else
      render :new
    end
  end

  private
    def trouser_params
      params.require(:trouser).permit(:image)
    end
end
