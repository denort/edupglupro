class AddContentTypeToClippedFile < ActiveRecord::Migration
  def change
    add_column :clipped_files, :content_type, :string

  end
end
