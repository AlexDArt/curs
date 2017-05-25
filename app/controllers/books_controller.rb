class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @authors = Author.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @book.authors.build
    @author = Author.all
  end

  # GET /books/1/edit
  def edit
    @book.authors.build
    @author = Author.all
  end

  def search
    if params.has_key?('search')
      @books = Book.search(params['search'])
    else
      @books = []
    end
    params['search'] ||= {}

  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @authors = []
    params[:book][:authors].each{|a| @authors << Author.find(a) if a.present?}
    respond_to do |format|
      if @book.save
        @authors.each{|a| a.books << @book if !(@book.authors.include?(@author))}
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
   def update
    @authors = []
    params[:book][:authors].each{|a| @authors << Author.find(a) if a.present?}
    respond_to do |format|
      if @book.update(book_params)
        @authors.each{|a| a.books << @book if !(@book.authors.include?(@author))}
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:isbn, :name, :part, :imprint_year, :number_of_shelf, :stack_id, :number_of_copies,
      authors_attributes: [:id, :second_name, :first_name, :last_name, :author_index, :_destroy])
    end
end
