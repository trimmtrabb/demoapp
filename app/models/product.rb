class Product < ApplicationRecord
  has_one_attached :video

  def video_url
    Rails.application.routes.url_helpers.url_for(video) if video.attached?
  end
end
