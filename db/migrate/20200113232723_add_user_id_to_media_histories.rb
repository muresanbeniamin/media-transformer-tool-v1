class AddUserIdToMediaHistories < ActiveRecord::Migration[6.0]
  def change
    add_reference :media_histories, :user
  end
end
