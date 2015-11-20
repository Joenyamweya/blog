class PostsController < ApplicationController

	#before_action :find_post except(:index, :new, :create, :destroy)

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			#flash[:notice] = "Post created successfully"
			redirect_to @post
		else
			render("new")
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @posts.update(post_params)
			#flash[:notice] = "Post updated successfully"
			redirect_to @post
		else
			render("edit")
		end
	end

	def delete
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id]).destroy
		flash[:notice] = "Post deleted successfully"
		redirect_to(:action => "index") 
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end

end
