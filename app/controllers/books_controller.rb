class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
     if @book.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(@book.id)
     else
      @books = Book.all
      render :index
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
  
  def update
      @book = Book.new(book_params)
     if @book.save
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book.id)
     else
      @books = Book.all
      render :index
     end
  end
  
  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト  
  end
  
  private
   def book_params
     params.require(:book).permit(:title, :body)
   end
  
end
