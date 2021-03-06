class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :amount
      t.references :votable, polymorphic: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
