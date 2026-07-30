class SetDefaultLimitedCountForProducts < ActiveRecord::Migration[8.1]
  def change
    # Устанавливаем значение по умолчанию для новых записей
    change_column_default :products, :limited_count, from: nil, to: 0
    
    # Обновляем существующие NULL значения на 0
    Product.where(limited_count: nil).update_all(limited_count: 0)
  end
end
