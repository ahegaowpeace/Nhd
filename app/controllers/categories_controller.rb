class CategoriesController < ApplicationController
  def index
    #@categories = Category.order(name: :asc).to_a
		@categories = cache_categories
  end

	def show
		@category = Category.find_by(name: "#{params[:category]}")
		@books = @category.books.page(params[:page]).per(28)
	end

  private

  def cache_categories
    Rails.cache.fetch("cache_categories", expires_in: 60.minutes) do
      Category.order(name: :asc).to_a
    end
  end
end
