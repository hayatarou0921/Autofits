module RandomOutfit

  private
    def random_outfit
      set
    end

    def rerandom_outfit
      set_another_outfit
    end

    def shuffle
      first = Outfit.first.id
      last = Outfit.last.id
      @outfit = Outfit.where(user_id: current_user.id).find_by(id: Random.rand(first..last))
    end
end