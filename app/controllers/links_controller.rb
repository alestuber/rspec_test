class LinksController < ApplicationController
  def index
    @links = Link.hottest_first
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to @link
    else
      render :new
    end
  end

  def upvote
    @link = Link.find(params[:id])
    @link.upvote

    redirect_to root_path
  end

  def downvote
    @link = Link.find(params[:id])
    @link.downvote

    redirect_to root_path
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
