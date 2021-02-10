class SearchController < ApplicationController
  def index
		@books = Book.where('title like ?', "%#{params[:keyword]}%").order(title: :asc).page(params[:page]).per(28)
  end
end
