class Product < ApplicationRecord
      has_one_attached :featured_image
      has_rich_text :description
      validates :name, presence: true
end

# store(dev)> Product.column_names
# => ["id", "name", "created_at", "updated_at"]