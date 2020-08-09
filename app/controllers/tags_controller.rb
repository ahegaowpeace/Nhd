class TagsController < ApplicationController
  def index
		@tags = Tag.order(name: :asc)
  end

  def show
		@tag = Tag.find_by(name: "#{params[:tag]}")
		@books = @tag.books.page(params[:page]).per(28)
  end
end
