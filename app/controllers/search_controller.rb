class SearchController < ApplicationController
	def search
		if params[:category] == "user"
			if params[:search_method] == "perfect_match"
				@searches = User.where(name: "#{params[:search]}")
			elsif params[:search_method] == "forward_match"
				@searches = User.where("name LIKE?","#{params[:search]}%")
			elsif params[:search_method] == "backward_match"
				@searches = User.where("name LIKE?","%#{params[:search]}")
			elsif params[:search_method] == "partial_match"
				@searches = User.where("name LIKE?","%#{params[:search]}%")
			end

		elsif params[:category] == "book"
			if params[:search_method] == "perfect_match"
				@searches = Book.where(title: "#{params[:search]}")
			elsif params[:search_method] == "forward_match"
				@searches = Book.where("title LIKE?","#{params[:search]}%")
			elsif params[:search_method] == "backward_match"
				@searches = Book.where("title LIKE?","%#{params[:search]}")
			elsif params[:search_method] == "partial_match"
				@searches = Book.where("title LIKE?","%#{params[:search]}%")
			end
		end
	end
end
