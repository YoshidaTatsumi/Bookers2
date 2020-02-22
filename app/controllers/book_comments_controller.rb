class BookCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		@book_comment = current_user.book_comments.new(book_comment_params)
		@book_comment.book_id = book.id
		@books = Book.find(params[:book_id])
		@book = Book.new
		@user = @books.user

		if @book_comment.save
			redirect_to book_path(book)
		else
			render 'books/show'
		end
	end

	def destroy
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.find_by(book_id: book.id)
		comment.destroy
        redirect_back(fallback_location: root_path)
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
