module Api
  module V1
    class CarsController < ApplicationController
      before_action :set_car, only: %i[ show update destroy ]

      # GET /cars or /cars.json
      def index
        cars = Car.includes(:owners, :modifications).all

        render json: cars, include: [ :modifications, :owners ]
      end

      # GET /cars/1 or /cars/1.json
      def show
        render json: @car, only: [ :brand, :model, :year ], include: [ :modifications, owners: { only: :name } ]
      end

      def legal
        cars = Car.where(legal: true)

        render json: cars
      end

      def illegal
        cars = Car.where(legal: false)

        render json: cars
      end

      def search
        col_to_search = params[:col]
        query = params[:query]

        cars = Car.where(col_to_search.to_sym => query)
        if !cars.empty?
          render json: cars
        else
          render json: { "error": "No cars found" }
        end
      end

      # POST /cars or /cars.json
      def create
        car = Car.new(car_params)

          if car.save
            render json: car, status: :created
          else
            render json: car.errors, status: :unprocessable_entity
          end
      end

      # PATCH/PUT /cars/1 or /cars/1.json
      def update
        if @car.update(car_params)
          render json: @car, status: :ok
        else
          render json: @car.errors, status: :unprocessable_entity
        end
      end

      # DELETE /cars/1 or /cars/1.json
      def destroy
        car.destroy!

        respond_to do |format|
          format.html { redirect_to cars_url, notice: "Car was successfully destroyed." }
          format.json { head :no_content }
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_car
        @car = Car.includes(:owners, :modifications).find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def car_params
        params.require(:car).permit(:model, :brand, :year, :license, :legal)
      end
    end
  end
end
