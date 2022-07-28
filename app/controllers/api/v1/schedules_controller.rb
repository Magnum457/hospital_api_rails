module Api
    module V1
        class SchedulesController < ApplicationController
            before_action :set_schedule, only: %i[update show destroy]
            # GET /schedules
            def index
                @schedules = Schedule.all
                render json: SchedulesRepresenter.new(@schedules).as_json
            end

            # POST /schedules
            def create
                @schedule = Schedule.create(schedule_params)
                if @schedule.save
                    render json: ScheduleRepresenter.new(@schedule).as_json, status: :created
                else
                    render json: @schedule.errors, status: :unprocessable_entity
                end
            end

            # GET /schedules/:id
            def show
                render json: ScheduleRepresenter.new(@schedule).as_json
            end

            # PUT /schedules/:id
            def update
                @schedule.update(schedule_params)
                head :no_content
            end

            # DELETE /schedules/:id
            def destroy
                @schedule.destroy
                head :no_content
            end

            private
            def schedule_params
                params.permit(:medic_id, :day, :time)
            end
            def set_schedule
                @schedule = Schedule.find(params[:id])
            end
        end
    end
end