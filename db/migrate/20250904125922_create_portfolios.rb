class CreatePortfolios < ActiveRecord::Migration[7.1]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.decimal :balance
      t.decimal :performance
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
