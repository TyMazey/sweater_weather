class AntipodeFacade < LocationFacade


  def get_antipode
    anti_city = amypodeservice.antipode(get_location)

  end
end
