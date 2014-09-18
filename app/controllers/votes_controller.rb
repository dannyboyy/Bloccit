class VotesController < ApplicationController
  before_action :load_post_and_vote

  def up_vote
    redirect_to :back
  end

  def update_vote(new_value)
    if @vote
       authorize @vote, :update?
      @vote.update_attribute(:value, new_value)
    else
       @vote = current_user.votes.build(value: new_value, post: @post)
       authorize @vote, :create?
       @vote.save
    end
  end


  private

  def load_post_and_vote
    @post = Post.find(params[:id])
    @vote = @post.votes.where(user_id: current_user.id).first
  end

  def update_vote!(new_value)
    if @vote
      @vote.update_attribute(:value, 1)
    else
      @vote = current_user.votes.create(value: 1, post: @post)
    end
  end




end
