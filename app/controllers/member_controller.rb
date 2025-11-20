class MemberController < ApplicationController
  include ApplicationHelper

  def profile
    member_id = params[:member_id]
    if member_id.to_s.match?(/\A\d+\z/)
      user_id = to_user_id(member_id)
      return render template: "errors/render_404", layout: false, status: :not_found if user_id == false
      @user = User.valid.find_by(id: user_id)
      render template: "errors/render_404", layout: false, status: :not_found if @user.blank?
    end
  end
end
