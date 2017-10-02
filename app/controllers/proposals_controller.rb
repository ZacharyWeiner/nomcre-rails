class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :edit_details, :payment, :update, :destroy]
  layout 'adminlte'

  # GET /proposals
  # GET /proposals.json
  def index
    if current_user.company.nil?
      @proposals = Proposal.where(user: current_user).order(:created_at).page params[:page]
    else
      @proposals = Proposal.where(company: current_user.company).order(:created_at).page params[:page]
    end
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  def edit_details
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(proposal_params)

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    respond_to do |format|
      unless params[:proposal][:bts].nil? || params[:proposal][:bts].count == 0
        @proposal.bts.clear
        params[:proposal][:bts].each do |bt|
          @proposal.bts << bt
        end
      end
      unless params[:proposal][:focus_points].nil? || params[:proposal][:focus_points].count == 0
        @proposal.focus_points.clear
        params[:proposal][:focus_points].each do |fp|
          @proposal.focus_points << fp
        end
      end
      if @proposal.update(proposal_params)
        format.html { redirect_to @proposal, notice: 'Proposal was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal.destroy
    respond_to do |format|
      format.html { redirect_to proposals_url, notice: 'Proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def payment
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      unless params[:id].nil?
        @proposal = Proposal.find(params[:id])
      else
        @proposal = Proposal.find(params[:proposal_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(:title, :content, :deadline, :price, :accepted, :company_id, :proposal_type, :completed, :completed_on, :paid, :charge_id, :bts, :focus_points, :time_of_day, :location, :background)
    end
end
