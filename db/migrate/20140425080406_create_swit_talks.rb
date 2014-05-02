class CreateSwitTalks < ActiveRecord::Migration
  def change
    create_table :swit_talks do |t|
      t.string :mark
      t.text :text

      t.timestamps
    end
  end
end
