class CommentsController < ApplicationController
  def create
    @boards = Board.all.order("id DESC")
    @board = Board.find(params[:board_id])
    @comment = Comment.new(comment_params)
    @comment.board = @board

    if @comment.save
      redirect_to board_path(@board.id),notice: "コメントしました"
    else
      flash.now[:alert] = "コメントができませんでした"
      render "boards/show"
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
   	@comment = Comment.find(params[:id])
   	@comment.destroy
   	redirect_to board_url(@board),notice: "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image, :board_id).merge(user_id: current_user.id)
  end
end
