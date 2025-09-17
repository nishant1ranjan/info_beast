class Admin::BlogsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_blog, only: [:show, :edit, :update, :destroy, :publish, :unpublish]

	def index
		@blogs = Blog.all.order(created_at: :desc)
	end

	def show
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.admin = current_admin
		if @blog.save
			redirect_to admin_blog_path(@blog), notice: 'Blog was successfully created.'
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
	end

	def update
		if @blog.update(blog_params)
			redirect_to admin_blog_path(@blog), notice: 'Blog was successfully updated.'
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@blog.destroy
		redirect_to admin_blogs_path, notice: 'Blog was successfully deleted.'
	end

	def publish
		@blog.update(published: true, published_at: Time.current)
		redirect_to admin_blogs_path, notice: 'Blog published.'
	end

	def unpublish
		@blog.update(published: false)
		redirect_to admin_blogs_path, notice: 'Blog unpublished.'
	end

	private
		def set_blog
			@blog = Blog.find(params[:id])
		end

		def blog_params
			params.require(:blog).permit(:title, :content, :published)
		end
end
