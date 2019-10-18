class MilkshakesController < ApplicationController

    def index
        if params[:search] && !params[:search].empty?
            @milkshakes = Milkshake.where(name: params[:search])
        else
            @milkshakes = Milkshake.all
        end
    end

    def show
        @milkshake = Milkshake.find(params[:id])
    end

    def new
        @milkshake = Milkshake.new
    end

    def create
        whitelisted_params = params.require(:milkshake).permit(:name, :description, :price)
        @milkshake = Milkshake.create(whitelisted_params)

        if @milkshake.errors.any?
            render "new"
        else
        redirect_to milkshake_path(@milkshake)
        end
    end

end
