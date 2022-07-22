class SpecialtiesRepresenter
    def initialize(specialties)
        @specialties = specialties
    end

    def as_json
        @specialties.map do |specialty|
            {
                id: specialty.id,
                name: specialty.name
            }
        end
    end

    private
    attr_reader :specialties
end