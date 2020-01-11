class BooksController < ApplicationController
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@user = current_user
		@users = User.all
		if @book.save
			redirect_to book_path(@book)
		else
			render template: "users/index"
		end
	end
	def index
		@book = Book.new
		@books = Book.all
		@user = current_user
	end
	def show
		@books = Book.find(params[:id])
		@book = Book.new
	end
	def edit
		@book = Book.find(params[:id])
		if @book.user != current_user
			redirect_to books_path
		end
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book.id)
		else
			render 'edit'
		end
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end
	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
