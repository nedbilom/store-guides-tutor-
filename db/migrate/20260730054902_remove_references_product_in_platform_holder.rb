class RemoveReferencesProductInPlatformHolder < ActiveRecord::Migration[8.1]
  def change
    remove_reference :platform_holders, :product, foreign_key: true
  end
end
