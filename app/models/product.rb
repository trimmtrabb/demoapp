class Product < ApplicationRecord
  has_many_attached :videos

  # def video_urls
  #   videos.map { |v| Rails.application.routes.url_helpers.url_for(v) }
  # end
end
