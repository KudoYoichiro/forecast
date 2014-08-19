class RenameColumnConditionToConditionText < ActiveRecord::Migration
  def change
    rename_column :sales_forecasts, :condition, :condition_text
  end
end
