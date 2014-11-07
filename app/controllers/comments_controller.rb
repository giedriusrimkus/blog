class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def create
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:name, :body))
		redirect_to post_path(@post)
		
		# if @comment.errors.any?
  		#	render 'new'
		# else
  		#	redirect_to @post
		# end

		#if @comment.save
      	#	flash[:success] = "Your comment has been succesfully submited! Thank you."
      	#	redirect_to post_path(@post)
    	#else
    	#	flash[:failure] = "Oops... "
    		# render 'new'
      	#	redirect_to post_path(@post)
    	#end
	end

	def destroy
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	def edit
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def update
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.find(params[:id])

		if @comment.update(comments_params)
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end
	
	private

	def comments_params
		params.require(:comment).permit(:name, :body)
	end
end
