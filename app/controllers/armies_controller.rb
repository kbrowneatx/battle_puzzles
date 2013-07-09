class ArmiesController < ApplicationController
  before_filter :find_army, except: [:index, :new, :create, :update_nations]
  before_filter :set_current_user
  respond_to :html, :js
  
  def index
    @armies = @user.armies
  end

  def show
    @army = @user.armies.find params[:id]
  end

  def new
    @eras = Era.all.map{|p| [p.name, p.id]}.insert(0, "Select an Era to Play")
    @nations = []
    @army = @user.armies.new

    (@army.divisions_allowed).times do
      division = @army.divisions.build
      (@army.battalions_allowed).times { division.battalions.build }
    end
  end

  def create
    @army = @user.armies.new(params[:army])
    if @army.save
      redirect_to @army
    else
      render :edit
    end 
  end

  def edit
    @army = Army.find params[:id]
    if @army.divisions.count == 0 
      division = @army.divisions.build
      (@army.battalions_allowed).times { division.battalions.build }
    end
    @types_array = UnitType.of_nat(@army.nation_id).map{|u| [u.name, u.id]}
  end

  def update
    if @army.update_attributes(params[:army])
      redirect_to @army
    else
      render :edit
    end
  end

  def destroy
    if @army.destroy
      @armies = @user.armies
      respond_to do |format|
        format.js {}
      end
    else
      redirect_to @army, error: "Error deleting Army. Try again or contact game administrator"
    end
  end
  
  def find_army
    @army = Army.find(params[:id])
  end

  def update_nations
    # map to name and id for use in our options_for_select
    puts "you got to the update_nationalities method"
    @nations = Nation.of_era(params[:era_id]).map{|n| [n.name, n.id]}.insert(0, "Select a Nation to Play")
  end

end
