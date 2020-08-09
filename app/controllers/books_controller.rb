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
			# 既存のカテゴリの場合
			if @category
				@ctgrelation = Ctgrelation.new(book_id: @book.id, category_id: @category.id)
				if @ctgrelation.save
					redirect_to book_path(@book.id)
				end
			# 新規カテゴリの場合
			else
				@category = Category.new(name: params.require(:ctgname))
				if @category.save
					@ctgrelation = Ctgrelation.new(book_id: @book.id, category_id: @category.id)
					if @ctgrelation.save
						redirect_to book_path(@book.id)
					end
				end
			end
		end
		# タグPOST処理
		if params[:sendtag]
			@tag = Tag.find_by(name: params.require(:tagname))
			# 既存のタグの場合
			if @tag
				@tagrelation = Tagrelation.new(book_id: @book.id, tag_id: @tag.id)
				if @tagrelation.save
					redirect_to book_path(@book.id)
				end
			# 新規タグの場合
			else
				@tag = Tag.new(name: params.require(:tagname))
				if @tag.save
					@tagrelation = Tagrelation.new(book_id: @book.id, tag_id: @tag.id)
					if @tagrelation.save
						redirect_to book_path(@book.id)
					end
				end
			end
		end
	end

	def delatr
		# カテゴリDELETE処理
		if params[:ctgname]
			bookid = params[:id]
			@category = Category.find_by(name: params.require(:ctgname))
			@ctgrelation = Ctgrelation.find_by(book_id: bookid, category_id: @category.id)
			if @ctgrelation.destroy
				redirect_to book_path(bookid)
			end
		elsif params[:tagname]
			bookid = params[:id]
			@tag = Tag.find_by(name: params.require(:tagname))
			@tagrelation = Tagrelation.find_by(book_id: bookid, tag_id: @tag.id)
			if @tagrelation.destroy
				redirect_to book_path(bookid)
			end
		end
	end
end
