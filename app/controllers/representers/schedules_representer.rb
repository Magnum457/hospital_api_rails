class SchedulesRepresenter
    def initialize(schedules)
        @schedules = schedules
    end

    def as_json
        @schedules.map do |schedule|
            {
            id: schedule.id,
            medic: Medic.find(schedule.medic_id).name,
            day: schedule.day,
            time: schedule.time,
            }
        end
    end

    private
    attr_reader :schedules
end