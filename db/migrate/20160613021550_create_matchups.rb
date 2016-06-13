class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|

      t.timestamps null: false
    end
  end
end
