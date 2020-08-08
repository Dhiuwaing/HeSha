class Api::V1::PostsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

def index
  @posts = Post.all
end

def show
  @post = Post.find(params[:id])
end

def create
  @post = Post.new(post_params)
  if @post.save
    render :show
  else
    render_error
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy
end

private

def post_params
  params.require(:post).permit(:image, :description, :user_id, :recipe_id)
end

def render_error
  render json: {error: @post.errors.full_messages}
  end
end
