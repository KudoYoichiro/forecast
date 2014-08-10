class CreateSalesForecasts < ActiveRecord::Migration
  def change
    create_table :sales_forecasts do |t|
      t.references :service_center, index: true
      t.references :segment, index: true
      t.references :status, index: true
      t.references :area, index: true
      t.string :company
      t.string :division
      t.string :customer_name
      t.string :instrument
      t.integer :price
      t.references :budget, index: true
      t.references :certainty, index: true
      t.string :reporting_date
      t.string :fixed_date
      t.string :order_date
      t.string :agent
      t.text :condition
      t.string :person_in_charge
      t.boolean :visible

      t.timestamps
    end
  end
end
