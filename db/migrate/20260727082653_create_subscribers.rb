class CreateSubscribers < ActiveRecord::Migration[8.1]
  def change
    create_table :subscribers do |t|
      # Аналогично на JS
      # t.belongs_to("product", { null: false }, { foreign_key: true });
      t.belongs_to :product, null: false, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
