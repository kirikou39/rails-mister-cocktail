class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = Dose.where(cocktail: @cocktail)
    @dose = Dose.new
  end
  
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient_id].to_i)
    
    # CREATE NEW DOSE
    @dose = Dose.new(dose_params)
    # ASSIGN LINKED OBJECTS
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    # SAVE
    @dose.save
    # REDIRECT
    redirect_to cocktail_path(@cocktail)
  end
  
  def destroy
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
