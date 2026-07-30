class AddPlatformHolderToProducts < ActiveRecord::Migration[8.1]
  def change
    add_reference :products, :platform_holder, null: false, default: 1, foreign_key: true
  end
end
