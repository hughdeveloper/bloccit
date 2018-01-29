class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body

      #the index on the references line tells the database to index the post_id column, so it can be searched efficiently. This is always a good idea for foreign keys, and is added automatically when you generate with the references argument.
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
