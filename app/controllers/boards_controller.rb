class BoardsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]

  def index
    @boards = Board.all.order("id DESC")
  end

  def new
    @boards = Board.all.order("id DESC")
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    if @board.save
      redirect_to board_path(@board.id),notice: "スレッドを作成しました"
    else
      @boards = Board.all.order("id DESC")
      flash.now[:alert] = "スレッドを作成できませんでした"
      render ("/boards/new")
    end
  end

  def show
    @boards = Board.all.order("id DESC")
    @board = Board.find(params[:id])
  end

  def edit
    @boards = Board.all.order("id DESC")
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board.id),notice: "スレッドを編集しました"
    else
      @boards = Board.all.order("id DESC")
      flash.now[:alert] = "スレッドを作成できませんでした"
      render action: :edit
    end
  end

  def destroy
    Board.delete(params[:id])
    redirect_to boards_path,notice: "スレッドを削除しました"
  end

  private

    def board_params
      params.require(:board).permit(:title, :content).merge(user_id: current_user.id)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

end
