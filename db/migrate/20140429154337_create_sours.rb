class CreateSours < ActiveRecord::Migration
  def change
    create_table :sours do |t|
      t.string :commenter
      t.integer :article_id

      t.timestamps
    end
  end
end
