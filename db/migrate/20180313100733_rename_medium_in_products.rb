class RenameMediumInProducts < ActiveRecord::Migration[5.1]
  def change
  	rename_column :products, :medium, :mediums
  end
end
