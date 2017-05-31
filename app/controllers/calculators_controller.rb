class CalculatorsController < ApplicationController

  def index
    @calculators = Calculator.all

    respond_to do |format|
      format.html { render :index }
    end
  end

  def update
    calculator = Calculator.find(params[:id])
    calculations = params[:calculator][:cells]

    unless calculator.update_attribute(:cells, calculations)
      flash[:error] = calculator.cells.errors['messages']
    end

    redirect_to root_path
  end

end
