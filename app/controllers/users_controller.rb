class UsersController < ApplicationController

	 before_action :authenticate_user!
    def new
        @user = User.new
        @book = Book.new
    end


    def create


        @book = Book.new(book_params)

    end


    def index
    	@users = User.all
        @books = Book.all
        @book = Book.new

    end

    def show
    	@user = User.find(params[:id])
    	@books = @user.books
    	@book = Book.new
        
    end

    def edit


    	@user = User.find(params[:id])
        if @user.id != current_user.id

        redirect_to user_path(current_user.id)

        end

    end



    def update
      @user = User.find(params[:id])
      if   @user.update(user_params)
           flash[:notice] = "You have updated user successfully."
           redirect_to user_path(@user.id)
      else
           render "edit"
      end
    end

    def destroy
        user = User.find(params[:id])
        if user.user_id == current_user.id
        user.destroy
        redirect_to user_session_path
        end
   end

  

    private




    def user_params
    	 params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def book_params
        params.require(:book).permit(:title, :body)
    end

    def correct_user
     @user = User.find(id: params[:id])
        unless @user
          redirect_to new_user_session
        end
　  end

end
