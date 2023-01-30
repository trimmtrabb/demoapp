class Api::V1::NotificationsController < ApplicationController
  def index
    @notifications =
      CursorPaginator.new(Notification).generate_page(safe_params.to_h)
  end

  private
    def safe_params
      params.with_defaults(order: 'asc',
                           size: '10',
                           cursor: {
                            nav_dir: 'after',
                            pointer: '10'
                           }).permit([:order, :size, cursor: [:nav_dir, :pointer]])
    end
end
