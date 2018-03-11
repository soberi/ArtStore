class AddMediumToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :medium, :string
  end
end
