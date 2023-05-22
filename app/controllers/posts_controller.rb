class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path(@post), notice: "つぶやき完了☑️"
      else
        render :new
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "つぶやきを削除したよ"
  end

  def confirm
    @post = Post.new(post_params)
  end

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "編集完了"
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
