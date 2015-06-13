class CreateClippedFiles < ActiveRecord::Migration
  def change
    create_table :clipped_files do |t|
      t.string :name
      t.references :lecture, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
