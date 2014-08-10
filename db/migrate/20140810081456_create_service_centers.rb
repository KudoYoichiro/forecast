class CreateServiceCenters < ActiveRecord::Migration
  def change
    create_table :service_centers do |t|
      t.string :name

      t.timestamps
    end
  end
end
