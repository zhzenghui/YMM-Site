class TagsController < ApplicationController
	def create
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new(tag_params)



    if @tag.save

      flash[:success] = "tag success!"
      redirect_to post_path(@post)
    else
      flash[:failure] = "tag failure!" + @tag.errors.full_messages.to_sentence

      redirect_to post_path(@post)
    end
  end



  def destroy
    @post = Post.find(params[:post_id])
    @tag = @post.tags.find(params[:id])
    @tag.destroy
    redirect_to post_path(@post)
  end



    private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @post = tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:tagr, :post_id)
    end
end
