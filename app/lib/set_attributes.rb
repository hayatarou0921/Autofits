module SetAttributes
  def set_items
    @tops = Top.where(user_id: current_user.id)
    @trousers = Trouser.where(user_id: current_user.id)
    @shoes = Shoe.where(user_id: current_user.id)
  end

  def set_id_from_params 
    @outfit.top_id = params[:outfit][:top]
    @outfit.trouser_id = params[:outfit][:trouser]
    @outfit.shoe_id = params[:outfit][:shoe]
  end

  def set_user_id(item)
    item.user_id = current_user.id
  end
end