class CreateCertainties < ActiveRecord::Migration
  def change
    create_table :certainties do |t|
      t.integer :name

      t.timestamps
    end
  end
end
