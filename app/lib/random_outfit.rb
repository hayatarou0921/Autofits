module RandomOutfit

  private
    def random_outfit
      @outfit = shuffle
      if @outfit.nil?
        shuffle
      end
    end

    def rerandom_outfit
      set_another_outfit
    end

    def shuffle
      first = Outfit.first.id
      last = Outfit.last.id
      @outfit = Outfit.find_by(id: Random.rand(first..last))
    end
end