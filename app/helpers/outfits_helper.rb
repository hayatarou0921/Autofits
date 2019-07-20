module OutfitsHelper
  def connect_top_id_to_user(outfit)
    user = User.find(outfit.user_id)
    top = user.tops.find(outfit.top_id)
    top
  end

  def connect_trouser_id_to_user(outfit)
    user = User.find(outfit.user_id)
    trouser = user.trousers.find(outfit.trouser_id)
    trouser
  end

  def connect_shoe_id_to_user(outfit)
    user = User.find(outfit.user_id)
    shoe = user.shoes.find(outfit.shoe_id)
    shoe
  end
end
