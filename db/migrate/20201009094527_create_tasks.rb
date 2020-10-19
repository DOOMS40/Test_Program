class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text     :name
      t.string  :status, :default => 'undone', :null => false
      t.datetime :deadline
      t.string  :priority, :default => 'low', :null => false
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
