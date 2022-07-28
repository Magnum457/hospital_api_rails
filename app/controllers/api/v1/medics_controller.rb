module Api
    module V1
        class MedicsController < ApplicationController
            before_action :set_medic, only: %i[update show destroy]
            # GET /medics
            def index
                @medics = Medic.all
                render json: MedicsRepresenter.new(@medics).as_json
            end

            # POST /medics
            def create
                @medic = Medic.create(medic_params)
                if @medic.save
                    render json: MedicRepresenter.new(@medic).as_json, status: :created
                else
                    render json: @medic.errors, status: :unprocessable_entity
                end
            end

            # GET /medics/:id
            def show
                render json: MedicRepresenter.new(@medic).as_json
            end

            # PUT /medics/:id
            def update
                @medic.update(medic_params)
                head :no_content
            end

            # DELETE /schedules/:id
            def destroy
                @medic.destroy
                head :no_content
            end

            private
            def medic_params
                params.permit(:specialty_id, :name, :crm, :telephone, :email)
            end
            def set_medic
                @medic = Medic.find(params[:id])
            end
        end
    end
end