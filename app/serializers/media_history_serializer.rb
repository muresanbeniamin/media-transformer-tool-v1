class MediaHistorySerializer < ActiveModel::Serializer
  attributes(:text)
  attributes(:date)
  attributes(:download_link)
  attributes :filename

  def download_link
    object.media_file.service_url
  end

  def date
    object.created_at
  end

  def text
    object.content
  end

end