class VotesController < ApplicationController
  before_filter :user_signed_in

  def create
    topic = Topic.find(params[:topic_id])
    vote = current_user.votes.build
    vote.topic = topic

    respond_to do |format|
      if vote.save
        format.html { redirect_to :back, notice: "Upvoted successfully!" }
        format.json { render json: vote }
      else
        format.html { redirect_to :back }
        format.json { render json: vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_user.votes.destroy(params[:id])

    respond_to do |format|
      # Respond the same way we were before if the request format is html
      format.html do
        flash[:notice] = "Vote removed."
        redirect_to :back
      end

      # Respond with a "204 No Content" to signify that the request has been
      # fulfilled
      format.json { head :no_content }
    end
  end

  private


  def user_signed_in
    redirect_to root_path, notice: 'Must sign in!' if current_user == nil
  end

end
