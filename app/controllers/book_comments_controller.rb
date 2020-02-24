class BookCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		@book_comment = current_user.book_comments.new(book_comment_params)
		@book_comment.book_id = book.id
		@books = Book.find(params[:book_id])
		@book = Book.new
		@user = @books.user

		if @book_comment.save
			# redirect_to request.referer
		else
			render 'books/show'
		end
	end

	def destroy
		@book_comment = BookComment.find(params[:book_id])
		@books = Book.find_by(id: @book_comment.book_id)
		if current_user.id != @book_comment.user_id
			redirect_to request.referer
		end
		@book_comment.destroy
        # redirect_to request.referer
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
