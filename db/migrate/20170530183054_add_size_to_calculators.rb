class AddSizeToCalculators < ActiveRecord::Migration[5.1]
  def change
    add_column :calculators, :width, :integer
    add_column :calculators, :height, :integer
  end
end
