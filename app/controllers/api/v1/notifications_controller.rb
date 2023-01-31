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
                            pointer: '-1'
                           }).permit([:order, :size, cursor: [:nav_dir, :pointer]])
    end

    def prev_page_link_params(pointer)
      params.merge(cursor: {
        nav_dir: 'before',
        pointer: '12'
      })
    end
end
