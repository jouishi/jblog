class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.string :movie
      t.date :published_at

      t.timestamps
    end
  end
end
