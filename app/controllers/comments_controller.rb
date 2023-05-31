class CommentsController < ApplicationController
  def create
    # find the correct article
    @article = Article.find(params[:article_id])

    # create the comment under the article
    @comment = @article.comments.create(comment_params)

    # go back to the article's show page
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
