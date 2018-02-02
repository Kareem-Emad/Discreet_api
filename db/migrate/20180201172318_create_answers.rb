class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :content
      t.string :up
      t.string :down

      t.belongs_to :question , foreign_key: true
      t.belongs_to :user , foreign_key: true

      t.timestamps
    end
  end
end
