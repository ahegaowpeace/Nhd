class BooksController < ApplicationController
  def index
    @books = Book.order(id: :desc).page(params[:page]).per(28)
  end

	def show
		@book = Book.find(params[:id])
	end

	def addatr
		@book = Book.find(params[:id])

		# カテゴリPOST処理
		if params[:sendctg]
			@category = Category.find_by(name: params.require(:ctgname))
			@category = Category.create(name: params.require(:ctgname)) if !@category		##新規カテゴリの場合##
			@ctgrelation = Ctgrelation.new(book_id: @book.id, category_id: @category.id)
			redirect_to book_path(@book.id) if @ctgrelation.save
		end
		# タグPOST処理
		if params[:sendtag]
			@tag = Tag.find_by(name: params.require(:tagname))
			@tag = Tag.create(name: params.require(:tagname)) if !@tag		##新規タグの場合##
			@tagrelation = Tagrelation.new(book_id: @book.id, tag_id: @tag.id)
			redirect_to book_path(@book.id) if @tagrelation.save
		end
		# 作者POST処理
		if params[:sendart]
			@artist = Artist.find_by(name: params.require(:artname))
			@artist = Artist.create(name: params.require(:artname)) if !@artist		##新規作者の場合##
			@artrelation = Artrelation.new(book_id: @book.id, artist_id: @artist.id)
			redirect_to book_path(@book.id) if @artrelation.save
		end
	end

	def delatr
		bookid = params[:id]
		# カテゴリDELETE処理
		if params[:ctgname]
			@category = Category.find_by(name: params.require(:ctgname))
			@ctgrelation = Ctgrelation.find_by(book_id: bookid, category_id: @category.id)
			redirect_to book_path(bookid) if @ctgrelation.destroy
		# タグDELETE処理
		elsif params[:tagname]
			@tag = Tag.find_by(name: params.require(:tagname))
			@tagrelation = Tagrelation.find_by(book_id: bookid, tag_id: @tag.id)
			redirect_to book_path(bookid) if @tagrelation.destroy
		# 作者DELTE処理
		elsif params[:artname]
			@artist = Artist.find_by(name: params.require(:artname))
			@artrelation = Artrelation.find_by(book_id: bookid, artist_id: @artist.id)
			redirect_to book_path(bookid) if @artrelation.destroy
		end
	end
end
