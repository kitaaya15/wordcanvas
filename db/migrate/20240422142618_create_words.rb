class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string     :content             , null: false
      t.integer    :level_id            , null: false
      t.text       :meaning
      t.text       :phonetic_symbol
      t.text       :part_of_speech
      t.text       :etymology
      t.text       :example_sentence
      t.text       :other
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
