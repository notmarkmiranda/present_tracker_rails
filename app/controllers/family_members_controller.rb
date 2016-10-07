class FamilyMembersController < ApplicationController

  def index
    @family_members = FamilyMember.all
  end

  def new
  end

  def create
    fam = Relationship.from_family_member(family_member_params)
    if fam.save
      flash[:success] = "New Person Created!"
      redirect_to family_members_path
    else
      flash.now[:danger] = "something went wrong!"
      render :new
    end
  end

  private

  def family_member_params
    params.require(:family_member).permit(:first_name, :last_name, :birthdate, :relationship_id)
  end
end
