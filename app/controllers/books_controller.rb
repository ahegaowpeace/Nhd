class BooksController < ApplicationController
  def index
    @books = Book.order(id: :desc).page(params[:page]).per(28)
  end

	def show
		@book = Book.find(params[:id])
		@category = Category.new
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
	end

	def delatr
		# カテゴリDELETE処理
		if params[:ctgname]
			bookid = params[:id]
			@category = Category.find_by(name: params.require(:ctgname))
			@ctgrelation = Ctgrelation.find_by(book_id: bookid, category_id: @category.id)
			redirect_to book_path(bookid) if @ctgrelation.destroy
		elsif params[:tagname]
			bookid = params[:id]
			@tag = Tag.find_by(name: params.require(:tagname))
			@tagrelation = Tagrelation.find_by(book_id: bookid, tag_id: @tag.id)
			redirect_to book_path(bookid) if @tagrelation.destroy
		end
	end
end
