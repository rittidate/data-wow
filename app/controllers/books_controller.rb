class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]
  skip_before_action :authenticate_user

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    render json: @books, include: [:tags]
  end

  # GET /books/1
  # GET /books/1.json
  def show
    render json: @book, include: [:tags]
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    if @book.update(book_params)
      render json: @book, include: [:tags]
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :serial_no, :description)
    end
end
