class CreateCalculators < ActiveRecord::Migration[5.1]
  def change
    create_table :calculators do |t|
      t.json :cells

      t.timestamps
    end
  end
end
