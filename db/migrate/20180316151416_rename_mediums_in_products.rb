class RenameMediumsInProducts < ActiveRecord::Migration[5.1]
  def change
  	rename_column :products, :mediums, :medium
  end
end
