class ScheduleRepresenter
    def initialize(schedule)
        @schedule = schedule
    end

    def as_json
        {
            id: @schedule.id,
            medic: Medic.find(@schedule.medic_id).name,
            day: @schedule.day,
            time: @schedule.time,
        }
    end

    private
    attr_reader :schedule
end