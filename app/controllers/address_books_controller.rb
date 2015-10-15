class AddressBooksController < ApplicationController
  before_action :set_address_book, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show]
  before_action :require_admin, only: [:destroy]
  before_action :require_userid, only: [:edit]
  
  
  respond_to :html, :js
  
  
  ##-----------------
  # 如果这里的action的名字xxx与view里xxx.html.erb不一致。需要以下方式说明其关系
  #respond_to do |format|
  #    
  #      format.html { render 'jqtest'}
  #      format.json { render 'jqtest' }
  #   
  #  end
  ##-----------------
  
  # GET /jquery
  # GET /jquery.json
  
  def jqueryindex
	@user = current_user
  end
  
  # GET /address_books
  # GET /address_books.json
  def index
    @address_books = AddressBook.all
  end

  # GET /address_books/1
  # GET /address_books/1.json
  def show
  end

  # GET /address_books/new
  def new
    @address_book = AddressBook.new
  end

  # GET /address_books/1/edit
  def edit
  end
#---------------------------------------
  #def create
  #  @new_post=Post.new(post_params)
  #  if @new_post.save 
  #  redirect_to '/posts' 
  #else 
  #    render 'new' 
  #end 
  #end
  
  #-----------------------------------------
  
  
  # POST /address_books
  # POST /address_books.json
  
  def create
	parzt=address_book_params
	parzt[:auth]=current_user.id
    @address_book = AddressBook.new(parzt)

    respond_to do |format|
      if @address_book.save
        format.html { redirect_to @address_book, notice: '创建成功！Address book created！' }
        format.json { render :show, status: :created, location: @address_book }
      else
        format.html { render :new }
        format.json { render json: @address_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /address_books/1
  # PATCH/PUT /address_books/1.json
  def update
    respond_to do |format|
      if @address_book.update(address_book_params)
        format.html { redirect_to @address_book, notice: '更新完成！Address book updated！' }
        format.json { render :show, status: :ok, location: @address_book }
      else
        format.html { render :edit }
        format.json { render json: @address_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /address_books/1
  # DELETE /address_books/1.json
  def destroy
    @address_book.destroy
    respond_to do |format|
      format.html { redirect_to address_books_url, notice: '删除完成！Address book destroyed！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address_book
      @address_book = AddressBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_book_params
      params.require(:address_book).permit(:contact_fname, :contact_lname, :email, :phone, :address, :city, :state, :zip,:auth)
    end
end
