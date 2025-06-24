class AddVisibilityToOffer < ActiveRecord::Migration[8.0]
  def change
    add_column :offers, :status, :integer
  end
end
