class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :category, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true
      t.string     :name

      t.timestamps null: false
    end
    add_index :questions, [:category_id, :created_at]
  end
end
