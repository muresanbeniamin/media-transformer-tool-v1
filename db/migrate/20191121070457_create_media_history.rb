class CreateMediaHistory < ActiveRecord::Migration[6.0]
  def change
    create_table :media_histories do |t|
      t.string :content
      t.string :transformation_type
      t.timestamps
    end
  end
end
