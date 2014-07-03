class ProfilesController < ApplicationController
  def show
    @user = User.find_by_profile_name(params[:id])
    if @user
      @statuses = @user.statuses.paginate(page: params[:page], per_page: 10)
      render action: :show
    else
      render 'public/404', status: 404, formats: [:html]
    end
  end
end
