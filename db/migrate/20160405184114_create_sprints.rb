class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.integer :number
      t.date :startDate
      t.date :endDate
      t.integer :velocityForecast
      t.integer :velocityReal
      t.integer :internalBugs
      t.integer :externalBugs
      t.float :teamSatisfaction
      t.float :clientSatisfaction

      t.references :project

      t.timestamps null: false
    end
  end
end
