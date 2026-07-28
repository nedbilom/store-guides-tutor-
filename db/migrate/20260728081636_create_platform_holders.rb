class CreatePlatformHolders < ActiveRecord::Migration[8.1]
  def change
    create_table :platform_holders do |t|
      t.string :name
      t.string :description
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
