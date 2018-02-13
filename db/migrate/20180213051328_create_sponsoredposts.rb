class CreateSponsoredposts < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsoredposts do |t|
      t.references :topic, foreign_key: true
      t.string :title
      t.text :body
      t.integer :price

      t.timestamps
    end
  end
end
