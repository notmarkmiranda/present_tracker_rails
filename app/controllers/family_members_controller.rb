class FamilyMembersController < ApplicationController
  before_action :require_user
  def index
    @family_members = FamilyMember.all
  end

  def new
    @fam = FamilyMember.new
  end

  def create
    fam = Relationship.from_family_member(family_member_params, "create")
    if fam.save
      flash[:success] = "New Person Created!"
      redirect_to family_members_path
    else
      flash.now[:danger] = "something went wrong!"
      render :new
    end
  end

  def edit
    @fam = FamilyMember.find(params[:id])
  end

  def update
    member = FamilyMember.find(params[:id])
    fam = Relationship.from_family_member(family_member_params, "update", member)
    if fam.save
      flash[:success] = "#{fam.first_name} updated!"
      redirect_to family_members_path
    end
  end

  private

  def family_member_params
    params.require(:family_member).permit(:first_name, :last_name, :birthdate, :relationship_id, :raw_relationship)
  end
end
