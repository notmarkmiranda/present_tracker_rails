class FamilyMembersController < ApplicationController

  def index
    @family_members = FamilyMember.all
  end

  def new
  end

  def create
    rel = Relationship.from_family_member(family_member_params[:relationship_id])
    family_member = FamilyMember.new(family_member_params)
    family_member.relationship_id = rel.id
    if family_member.save
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
