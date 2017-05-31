class CalculatorsController < ApplicationController

  def show
    @calculator = Calculator.first

    render :show
  end

  def update
    @calculator = Calculator.find(params[:id])
    calculations = params[:calculator][:cells]
    @calculator.update_attribute(:cells, calculations)

    if @calculator.errors.present?
      flash[:error] = @calculator.errors.messages[:base]
    end

    # render json: @calculator

    respond_to do |format|
      format.js
      format.json { render json: @calculator, status: :created, location: @calculator }
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
