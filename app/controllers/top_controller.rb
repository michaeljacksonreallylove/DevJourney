class TopController < ApplicationController
  def index
    @mokumoku_sessions = MokumokuSession.valid
                                        .includes(:user)
                                        .where(users: { is_deleted: false })
                                        .order(created_at: :desc)
                                        .limit(3)

    @material_reviews = MaterialReview.valid
                                      .includes(:user)
                                      .where(users: { is_deleted: false })
                                      .order(created_at: :desc)
                                      .limit(3)
  end
end
