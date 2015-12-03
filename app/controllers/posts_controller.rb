class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
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

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def delete
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end

end
