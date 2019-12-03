# == Schema Information
#
# Table name: media_histories
#
#  id                  :bigint           not null, primary key
#  content             :string
#  transformation_type :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class MediaHistory < ApplicationRecord
  has_one_attached :media_file
end
