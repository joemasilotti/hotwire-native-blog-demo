class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params.expect(:id))
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params.expect(:id))
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params.expect(:id))
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Post.find(params.expect(:id)).destroy!
    redirect_to posts_path, status: :see_other,
      notice: "Post was successfully destroyed."
  end

  private

  def post_params
    params.expect(post: [:title, :body, :image])
      .merge(user: current_user)
  end
end
