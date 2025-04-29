class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    post = Post.find(params.expect(:post_id))
    @comment = Comment.new(post:)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment.post, notice: "Comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params.expect(:id)).destroy!
    redirect_to comment.post, status: :see_other,
      notice: "Comment was successfully destroyed."
  end

  private

  def comment_params
    params.expect(comment: [:post_id, :author, :body])
  end
end
