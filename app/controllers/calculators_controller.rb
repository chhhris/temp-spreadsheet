class CalculatorsController < ApplicationController

  def index
    @calculators = Calculator.all

    respond_to do |format|
      format.html { render :index }
    end
  end

  private

  def calculator_params
    params.require(:calculator).permit(:id, :height, :width, :cells)
  end

end
