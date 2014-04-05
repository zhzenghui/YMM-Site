class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)



    if @comment.save

      flash[:success] = "comment success!"
      redirect_to post_path(@post)
    else
      flash[:failure] = "comment failure!" + @comment.errors.full_messages.to_sentence

      redirect_to post_path(@post)
    end
  end



  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end



    private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @post = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:commenter, :body, :post_id)
    end


end
