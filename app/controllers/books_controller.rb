class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
     if @book.save
      redirect_to book_path(@book.id)
     else
      render :new
     end
  end
  
  def show
    @book = Book.find(params[:id])  
  end
  
  def view
  @book = Book.new
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  private
   def book_params
     params.require(:book).permit(:title, :body)
   end
  
end
