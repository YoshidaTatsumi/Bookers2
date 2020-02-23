class BookCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		@book_comment = current_user.book_comments.new(book_comment_params)
		@book_comment.book_id = book.id
		@books = Book.find(params[:book_id])
		@book = Book.new
		@user = @books.user

		if @book_comment.save
			redirect_to request.referer
		else
			render 'books/show'
		end
	end

	def destroy
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.find_by(book_id: book.id)
		if current_user.id != comment.user_id
			redirect_to request.referer
		end
		comment.destroy
        redirect_to request.referer
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
