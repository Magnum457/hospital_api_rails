class MedicsRepresenter
    def initialize(medics)
        @medics = medics
    end

    def as_json
        @medics.map do |medic|
            {
                id: medic.id,
                name: medic.name,
                crm: medic.crm,
                telephone: medic.telephone,
                specialty: Specialty.find(medic.specialty_id).name
            }
        end
    end

    private
    attr_reader :medics
end