class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:name, :body))
	
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
		@comment = @post.comments.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@comment = @post.comments.find(params[:id])

		if @comment.update(params[:post].permit(:name, :body))
			redirect_to @comment
		else
			render 'edit'
		end
	end

end
