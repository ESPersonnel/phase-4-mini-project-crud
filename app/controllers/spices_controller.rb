class SpicesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def index
        spices = Spice.all
        render json: spices
    end

    # def show
    #     spices = find_spice
    #     render json: spices
    # end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spices = find_spice
        spices.update(spice_params)
        render json: spices
    end

    def destroy
        spices = find_spice
        spices.destroy
        render json: spices
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find(params[:id])
    end

    def record_not_found
        render json: { error: "Spice not found" }, status: :not_found
    end
end
