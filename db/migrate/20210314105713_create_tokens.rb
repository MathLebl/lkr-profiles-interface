class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
