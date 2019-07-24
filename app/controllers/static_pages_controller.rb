class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :logged_in
  def home
  end

  def about
  end

  private
    def logged_in
      if current_user
        redirect_to outfits_path, notice: 'すでにログインしています。'
      end
    end
end
