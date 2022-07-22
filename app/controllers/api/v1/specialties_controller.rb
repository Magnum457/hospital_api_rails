module Api
    module V1
        class SpecialtiesController < ApplicationController
            before_action :set_specialty, only: %i[update show destroy]
            # GET /specialties
            def index
                @specialties = Specialty.all
                # binding.pry
                render json: SpecialtiesRepresenter.new(@specialties).as_json
            end

            # POST /specialties
            def create
                @specialty = Specialty.create(specialty_params)
                # binding.pry
                if @specialty.save
                    render json: SpecialtyRepresenter.new(@specialty).as_json, status: :created
                else
                    render json: @specialty.errors, status: :unprocessable_entity
                end
            end

            # GET /specialties/:id
            def show
                # binding.pry
                render json: SpecialtyRepresenter.new(@specialty).as_json
            end

            # PUT /specialties/:id
            def update
                # binding.pry
                @specialty.update(specialty_params)
                head :no_content
            end

            # DELETE /specialties/:id
            def destroy
                # binding.pry
                @specialty.destroy
                head :no_content
            end

            private
            def specialty_params
                params.permit(:name)
            end
            def set_specialty
                # binding.pry
                @specialty = Specialty.find(params[:id])
            end
        end
    end
end