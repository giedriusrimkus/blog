class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		if params[:tag]
			@posts = Post.tagged_with(params[:tag]).order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
		else
			@posts = Post.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
		end
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			flash[:success] = "Your post has been successfully submitted!"
			redirect_to @post
		else
			flash[:danger] = "Oops... Something went wrong. "
			render 'new'
		end
	end

	def show
		@post = Post.friendly.find(params[:id])
		# @comment = @post.comments.build
	end

	def edit
		@post = Post.friendly.find(params[:id]) 
	end

	def update
		@post = Post.friendly.find(params[:id])

		if @post.update(params[:post].permit(:title, :body, :author, :tag_list))
			redirect_to @post
			flash[:success] = "Post has been updated."
		else
			flash[:danger] = "Oops... Something went wrong. "
			render 'edit'
		end
	end

	def destroy
		@post = Post.friendly.find(params[:id])
		@post.destroy
		flash[:success] = "Post has been deleted."
		redirect_to root_path
	end


	private

	def post_params
		params.require(:post).permit(:title, :body, :tag_list, :author)
	end
end
