class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show ]

  # GET /blogs
  def index
    @blogs = Blog.where(published: true).order(published_at: :desc)
  end

  # GET /blogs/1
  def show
    unless @blog.published?
      redirect_to blogs_path, alert: 'Blog not found.'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :published, :published_at, :admin_id)
    end
end
