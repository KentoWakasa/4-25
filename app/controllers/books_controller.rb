class BooksController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    @allbook = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = 'You have created book successfully.'
       redirect_to book_path(@book)
    else
       @user = current_user
       @allbook = Book.all
       render :index
    end
  end


  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = 'You have updated user successfully.'
       redirect_to book_path
    else
       render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end