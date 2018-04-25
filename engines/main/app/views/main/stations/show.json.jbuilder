
      json.id                 @posto.id
      json.name               @posto.name
      json.city               @posto.city.name
      json.latitude           @posto.latitude
      json.longitude          @posto.longitude
      json.schedule           @posto.schedule
      json.status             @posto.status
      json.observation        @posto.observation

      json.pessoas            @posto.responsibles do |i|
        json.id i.id
        json.name i.name
        json.contact i.contact
        json.email i.email
        json.observation i.observation
      end
