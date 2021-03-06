class BooksController < ApplicationController
 
  def create
    @books = Book.all
    @book = Book.new(book_params)
    
      if @book.save
        flash[:notice] = "successfully newbook!"
        redirect_to book_path(@book)
        
      else
        flash.now[:error] = @book.errors.full_messages
        render :index
      end
  end

  def index
      @book = Book.new
      @books = Book.all
  end

  def show
      @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    
  	if @book.update(book_params)
  	flash[:notice] = "successfully updated!"
  	redirect_to book_path(@book.id)
  	
  	else
        
        render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
  	book.destroy
  	flash[:notice] = "successfully!complete destroy"
  	redirect_to books_path

  end



  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
