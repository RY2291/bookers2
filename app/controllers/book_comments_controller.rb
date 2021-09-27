class BookCommentsController < ApplicationController
  def create
    book_comment = BookComment.new(comment_params)
    book_comment.user_id = current_user.id
    book_comment.save
    redirect_to books_path
  end

  def destroy
    @book_comment = BookComment.find
  end

  private
  def comment_params
    params.require(:book_comment).permit(:comment)
  end

end