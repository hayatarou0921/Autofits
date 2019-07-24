class OutfitsController < ApplicationController
  include OutfitCheck
  include RandomOutfit
  before_action :check_amount_of_outfit, only: [:set, :set_another_outfit]

  def index
    @outfits = Outfit.where(user_id: current_user.id).page(params[:page]).per(9)
  end

  def new
    @outfit = Outfit.new
    set_items
  end

  def create
    check_params
    if flash[:alert].nil?
      @outfit = Outfit.new
      set_id_from_params
      set_user_id(@outfit)
      if @outfit.save
        flash.notice = 'コーディネートを追加しました。'
        redirect_to outfits_path
      end
    else
      redirect_to new_outfit_path
    end
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    @message = 'コーディネートを削除しました。'
  end

  def set
    shuffle
    if @outfit.nil?
      random_outfit
    end
    @outfit
  end

  def set_another_outfit
    shuffle
    if @outfit.nil? || (@outfit.id.to_i == params[:outfit_id].to_i)
      rerandom_outfit
    else
      @outfit
    end
  end

  private
    def check_amount_of_outfit
      if Outfit.where(user_id: current_user.id).count <= 1
        flash[:alert] = '少なくとも２つ以上のコーデを作成してください。'
        redirect_to outfits_path
      end
    end
end