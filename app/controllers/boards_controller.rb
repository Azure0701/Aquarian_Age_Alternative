class BoardsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :board_all, except: [:destroy]
  before_action :set_board, except: [:index, :new, :create]
  
  def index
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    if @board.save
      redirect_to board_path(@board.id),notice: "スレッドを作成しました"
    else
      flash.now[:alert] = "スレッドを作成できませんでした"
      render ("/boards/new")
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board.id),notice: "スレッドを編集しました"
    else
      flash.now[:alert] = "スレッドを作成できませんでした"
      render action: :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path,notice: "スレッドを削除しました"
  end

  private

  def board_params
    params.require(:board).permit(:title, :content).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def board_all
    @boards = Board.all.order("id DESC")
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
