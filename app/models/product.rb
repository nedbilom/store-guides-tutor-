class Product < ApplicationRecord
      validates :name, presence: true
end

# store(dev)> Product.column_names
# => ["id", "name", "created_at", "updated_at"]