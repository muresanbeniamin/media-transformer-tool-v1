# == Schema Information
#
# Table name: media_histories
#
#  id                  :bigint           not null, primary key
#  content             :string
#  transformation_type :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  filename            :string
#  user_id             :bigint
#

class MediaHistory < ApplicationRecord
  has_one_attached :media_file
  belongs_to :user
end
