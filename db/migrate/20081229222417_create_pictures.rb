class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      # Actual model stuff
      t.references :post
      t.string :caption

      t.timestamps

      # Attachment_fu stuff
      t.references :parent
      t.string :content_type
      t.string :filename
      t.string :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height
    end
    add_index :pictures, :parent_id
    add_index :pictures, :post_id
  end

  def self.down
    drop_table :pictures
  end
end
