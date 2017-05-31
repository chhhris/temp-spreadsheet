class CalculatorsController < ApplicationController

  def show
    @calculator = Calculator.first

    render :show
  end

  def update
    @calculator = Calculator.find(params[:id])
    calculations = params[:calculator][:cells]

    if @calculator.update_attribute(:cells, calculations)
      redirect_to root_path
    else
      flash[:error] = @calculator.errors.messages[:base]
      render :show
    end
  end

  def create
    Calculator.create(width: params[:width], height: params[:height])

    redirect_to root_path
  end

  def destroy
    Calculator.destroy(params[:id])

    redirect_to root_path
  end

end
