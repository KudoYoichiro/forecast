class CreateJoinTableAreaServiceCenter < ActiveRecord::Migration
  def change
    create_join_table :areas, :service_centers do |t|
      # t.index [:area_id, :service_center_id]
      # t.index [:service_center_id, :area_id]
    end
  end
end
