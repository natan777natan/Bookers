class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@book = Book.new
  	@books = Book.all
  end

  def new
  end

  def create
  	@books = Book.all
  	@book = Book.new(book_params)
   if @book.save
  	redirect_to book_path(@book)
    flash[:book] = "Book was successfully created."
   else
    render "index"
   end
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
    redirect_to book_path(book.id)
    flash[:book] = "Book was successfully created."
  end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

    private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
