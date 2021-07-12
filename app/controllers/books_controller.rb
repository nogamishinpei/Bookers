class BooksController < ApplicationController
 def new
    @book = Book.new
 end

  def create
    # １. データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # ３. トップ画面へリダイレクト
    redirect_to '/books'
  end

  def index
      @books = Book.all
  end

  def show
      @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
     book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])  
    book.destroy 
    redirect_to books_path  
    
  end



  private
  # ストロングパラメータ
  def book_params
    params.permit(:title, :body)
  end
end
