class Tips < ActiveRecord::Migration[6.0]

   def change
    create_table :tips do |t|

      t.string :description
      t.references :user
      t.date :date

    end
  end
end