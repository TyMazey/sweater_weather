class FavoriteFacade < LocationFacade

  def initialize(user, citystate)
    @user = user
    @citystate = citystate
  end

  def create_favorite
    Favorite.create(user: @user, location: get_location)
  end
end
