class CreateNluCalls < ActiveRecord::Migration[6.0]
  def change
    create_table :nlu_calls do |t|
      t.text :response
      t.text :url

      t.timestamps
    end
  end
end
