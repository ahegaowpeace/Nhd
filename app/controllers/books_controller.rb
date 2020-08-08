class BooksController < ApplicationController
  def index
    @books = Book.order(id: :desc).page(params[:page]).per(28)
  end
end
