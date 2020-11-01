class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :videoid
      t.string :title
      t.string :color

      t.timestamps
    end
  end
end
