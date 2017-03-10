class CreateSubjectPages < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_pages do |t|
      t.string :category
      t.string :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
