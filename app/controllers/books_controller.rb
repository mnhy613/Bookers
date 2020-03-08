class BooksController < ApplicationController


  before_action :authenticate_user!
  def index
  	# @users = User.all
   #  @books = @users.books
    @books = Book.all
    @book = Book.new
  end

  def show
  	@books = Book.find(params[:id])
    @book = Book.new
    @one = Book.find(params[:id])
    @user = @one.user
  end

  def new
  	 @book = Book.new
  end

  def edit
  	@one = Book.find(params[:id])
     if current_user.id != @one.user.id
     redirect_to books_path
    end
  end

  def update
    @one = Book.find(params[:id])
    if @one.update(book_params)
           flash[:good] = "Book was successfully updated."
           redirect_to book_path(@one)
    else
           render 'edit'
    end

  end

  def create

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:success] = "You have creatad book successfully."
    redirect_to book_path(@book.id)

    else

    	  @books = Book.all
    	  render 'index'
    end

  end

  def destroy

    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end



  private

  def book_params
      params.require(:book).permit(:title, :body)
  end



end
