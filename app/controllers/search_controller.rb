class SearchController < ApplicationController
  def index
		@books = Book.where('title like ?', "%#{params[:keyword]}%").page(params[:page]).per(28)
  end
end
