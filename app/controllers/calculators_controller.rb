class CalculatorsController < ApplicationController

  def show
    @calculator = Calculator.first

    render :show
  end

  def update
    @calculator = Calculator.find(params[:id])
    calculations = params[:calculator][:cells]

    unless @calculator.update_attribute(:cells, calculations)
      flash[:error] = @calculator.errors.messages
    end

    redirect_to root_path
  end

  def create
    @calculator = Calculator.new(width: params[:width], height: params[:height])

    if @calculator.save
      flash[:success] = 'New spreadsheet'
    else
      flash[:error] = @calculator.errors.messages
    end

    redirect_to root_path
  end

  def destroy
    Calculator.destroy(params[:id])

    redirect_to root_path
  end

end
