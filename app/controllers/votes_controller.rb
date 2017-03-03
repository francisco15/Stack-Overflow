class VotesController < ApplicationController
  def create
    if (user_signed_in?)
      unless (Vote.already_vote?(current_user.id, params[:vote][:votable_id], params[:vote][:votable_type]))
        @vote = Vote.new(vote_params)
        if @vote.save
        else
          flash[:alert] = "The Vote hasn't been saved, due an system error"
        end
      else
        Vote.destroy_vote?(current_user.id, params[:vote][:votable_id], params[:vote][:votable_type])
        flash[:notice] = "The Vote has been eliminated"
      end
    else
      flash[:alert] = "You must been logged in order to vote"
    end
    respond_to do |f|
      f.html {redirect_to question_path(id: params[:question_id])}
    end
  end

  private
    def vote_comment
      @vote = Vote.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:amount, :votable_id, :votable_type, :user_id)
    end
end