class SpecialtyRepresenter
    def initialize(specialty)
        @specialty = specialty
    end

    def as_json
        {
            id: @specialty.id,
            name: @specialty.name
        }
    end

    private
    attr_reader :specialty
end