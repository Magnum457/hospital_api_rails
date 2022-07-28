class MedicRepresenter
    def initialize(medic)
        @medic = medic
    end

    def as_json
        {
            id: @medic.id,
            name: @medic.name,
            crm: @medic.crm,
            telephone: @medic.telephone,
            specialty: Specialty.find(@medic.specialty_id).name
        }
    end

    private
    attr_reader :medic
end