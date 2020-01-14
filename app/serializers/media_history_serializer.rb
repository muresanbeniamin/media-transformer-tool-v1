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

class MediaHistorySerializer < ActiveModel::Serializer
  attributes(:text)
  attributes(:date)
  attributes(:download_link)
  attributes :filename

  def download_link
    object.media_file.service_url
  end

  def date
    object.created_at.strftime("%B, %d, %Y")
  end

  def text
    object.content
  end

end
