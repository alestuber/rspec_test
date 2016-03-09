class Api::V1::LinksController < Api::BaseController
  def index
    links = Link.hottest_first

    render json: links
  end

  def create
    link = Link.new(link_params)

    if link.save
      status = :created
      payload = link
    else
      status = :unprocessable_entity
      payload = { errors: link.errors.full_messages }
    end

    render json: payload, status: status
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
