class CreateOffers < ActiveRecord::Migration[8.0]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :subtitle
      t.string :description

      t.timestamps
    end
  end
end
