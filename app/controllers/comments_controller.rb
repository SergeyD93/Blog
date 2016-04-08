class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])

    @comment = @article.comments.create(:body =>comment_params[:body],:user =>current_user, :parent_comment_id =>  params[:comment][:parent_comment_id])
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end

  def create_comment
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.js
      format.html
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)

    end
end
