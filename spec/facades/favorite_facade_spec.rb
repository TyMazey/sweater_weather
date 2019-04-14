require 'rails_helper'

RSpec.describe FavoriteFacade do

  it 'exist' do
    facade = FavoriteFacade.new("user", "location")

    expect(facade).to be_a(FavoriteFacade)
  end

  describe 'instance methods' do
    describe 'create_favorite' do
      it 'creates a refrence for the user and the location as a favorite' do
        user = User.create(email: "e", password: "p", api_key: "a")
        location = Location.create(citystate: 'a,a', latitude: "1", longitude: "1", image_url: "img")
        facade = FavoriteFacade.new(user, 'a,a')

        facade.create_favorite
        fave = Favorite.last
        expect(fave.user_id).to eq(user.id)
        expect(fave.location_id).to eq(location.id)
      end

      it 'creates a location then a refrence for the user and the location as a favorite' do
        user = User.create(email: "e", password: "p", api_key: "a")
        facade = FavoriteFacade.new(user, "Denver,CO")

        facade.create_favorite
        fave = Favorite.last
        locate = fave.location_id
        city = Location.find(locate)

        expect(fave.user_id).to eq(user.id)
        expect(city.citystate).to eq("Denver,CO")
      end
    end
  end
end
