class CategoriesController < ApplicationController
  def index
		@categories = Category.order(name: :asc)
  end

	def show
		@category = Category.find_by(name: "#{params[:category]}")
		@books = @category.books.page(params[:page]).per(28)
	end
end
