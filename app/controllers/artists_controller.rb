class ArtistsController < ApplicationController
  def index
		@artists = Artist.order(name: :asc)
  end

  def show
		@artist = Artist.find_by(name: "#{params[:artist]}")
		@books = @artist.books.page(params[:page]).per(28)
  end
end
