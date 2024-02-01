class CastFacade
  def initialize(id)
    @id = id
  end

  def members
  
    service = CastService.new

    json = service.cast_members(@id)
   
    @cast = json[:cast].map do |cast_member|
      Cast.new(cast_member)
    end
  end
end