class AddLimitedCountToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :limited_count, :integer, default: 0
  end
end
