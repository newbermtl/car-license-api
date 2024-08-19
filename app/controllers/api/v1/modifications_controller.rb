module Api
  module V1
    class ModificationsController < ApplicationController
      before_action :set_car

      def create
        mod = Modification.new(modification_params)
        mod.car = @car

        if mod.save
          render json: mod, include: :car
        else
          render json: mod.errors, status: :unprocessible_entity
        end
      end

      def index
        mods = @car.modifications

        render json: mods
      end

      def show
        mod = Modification.find(params[:id])

        render json: mod
      end

      private

      def modification_params
        params.require(:modification).permit(:name)
      end

      def set_car
        @car = Car.find(params[:car_id])
      end
    end
  end
end
