class AddFileNameToMediaHistories < ActiveRecord::Migration[6.0]
  def change
    add_column :media_histories, :filename, :string
  end
end
