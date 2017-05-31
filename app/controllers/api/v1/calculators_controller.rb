class Api::V1::CalculatorsController < Api::V1::BaseController

  def index
    respond_with Calculator.all
  end

  def create
    # calculator = Calculator.new(size: calculator_params[:size])
    # spreadsheet.save

    respond_with :api, :v1, Calculator.create(calculator_params)
  end

  def destroy
    respond_with Calculator.destroy(params[:id])
  end

  def update
    calculator = Calculator.find(params['id'])
    calculator.update_attributes(calculator_params)
    respond_with calculator, json: calculator
  end

  private

  def calculator_params
    params.require(:calculator).permit(:id, :height, :width, :cells)
  end

end
