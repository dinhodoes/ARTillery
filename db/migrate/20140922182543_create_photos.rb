class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|

    	t.string :url
    	t.string :tags

      t.timestamps
    end
  end
end
