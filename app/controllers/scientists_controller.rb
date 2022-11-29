class ScientistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::InvalidForeignKey, with: :render_unprocessable_entity_response





    # GET 

    def index
    scientists = Scientist.all 
    render json: scientists, status: :ok
    end

    # SHOW 

    def show
    scientist = Scientist.find_by(id: params[:id])
        if scientist
            render json: scientist, include: :planets, status: :ok
        else
            render json: {error: "Scientist not found"}, status: 404
        end
    end





    private

    def scientist_params 
        params.permit(:name, :field_of_study, :avatar)
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    def record_not_found
        render json: {error: "404 Not Found"}, status: 404
    end

end
