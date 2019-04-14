class FavoriteFacade < LocationFacade

  def initialize(user, citystate)
    @user = user
    @citystate = citystate
  end

  def create_favorite
    Favorite.create(user: @user, location: get_location)
  end

  def remove_favorite
    Favorite.find_by(user: @user, location: get_location).destroy
  end
end
