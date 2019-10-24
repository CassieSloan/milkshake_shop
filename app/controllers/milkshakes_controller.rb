class MilkshakesController < ApplicationController

    before_action :authenticate_user! #can't view milkshake unless signed in
    before_action :set_milkshake, only: [:show, :edit, :update] #only accept these params when editing milkshake
    before_action :set_user_milkshake, only: [:edit, :update] #ensure user can only edit their own milkshake.

    def index
        if params[:search] && !params[:search].empty?
            @milkshakes = Milkshake.where(name: params[:search])
        else
            @milkshakes = Milkshake.all
        end
    end

    def show
        session = Stripe::Checkout::session.create ( # :: = module 
            payment_method_type: ["card"],
            customer_email: current_user.email,
            line_items: [
                {
                name: @milkshake.name,
                description: @name.description,
                amount: @name.price,
                currency: "aud",
                quantity: 1,
                }
            ],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                listing_id: @milkshake.id
            }
        },
        success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
        cancel_url: "#{root_url}milkshakes/#{milkshake.id}"
    )

    @session_id = session.id

        )
    end

    def new
        @milkshake = Milkshake.new
        @ingredients = Ingredient.all
    end

    def create
        
        @milkshake = current_user.milkshakes.create(milkshake_params)

        if @milkshake.errors.any?
            # @milkshake.ingredients = Ingredients.where(:id params[:milkshake][:ingredient_ids])
            render "new"
        else
        redirect_to milkshake_path(@milkshake)
        end
    end

    def edit
        @ingredients = Ingredient.all
    end

    def update
    
        if @milkshake.update(whitelisted_params)
            redirect_to_milkshake_path(params[:id])
        else
            @ingredient = Ingredient.all
            render "edit"
        end
    end

    private
    def milkshake_params
        params.require(:milkshake).permit(:name, :description, :price, :pic, ingredient_ids: [])
    end

    def set_milkshake
        @milkshake = Milkshake.find(params[:id])
    end

    def set_user_milkshake
        @milkshake = current_user.milkshakes.find_by_id(params[:id])

        if @milkshake == nil
            redirect_to milkshakes_path
    end
    

end
