class ApplicationController < ActionController::API


  def paginate(resource)
    resource = resource.page(params[:page] || 1).per(params[:per_page] || 10)
    pagination = {
      current_page: resource.current_page,
      per_page: resource.limit_value,
      has_next_page: resource.next_page.present?
    }
    [pagination, resource]
  end
end
