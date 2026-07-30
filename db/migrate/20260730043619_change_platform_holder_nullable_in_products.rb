class ChangePlatformHolderNullableInProducts < ActiveRecord::Migration[8.1]
  def change
    change_column_null :products, :platform_holder_id, true
    change_column_default :products, :platform_holder_id, from: 1, to: nil
  end
end
