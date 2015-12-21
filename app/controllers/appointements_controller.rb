class AppointementsController < ApplicationController
  before_action :set_appointement, only: [:show, :edit, :update, :destroy, :report, :report_mail]

  def index
    @appointements = Appointement.all
  end

  def show
  end

  def new
    @appointement = Appointement.new
    @appointement.appointement_indicators.build
  end

  def edit
  end

  def create
    byebug
    @appointement = Appointement.new(appointement_params)

    respond_to do |format|
      if @appointement.save
        format.html { redirect_to @appointement, notice: 'Appointement was successfully created.' }
        format.json { render :show, status: :created, location: @appointement }
      else
        format.html { render :new }
        format.json { render json: @appointement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointement.update(appointement_params)
        format.html { redirect_to @appointement, notice: 'Appointement was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointement }
      else
        format.html { render :edit }
        format.json { render json: @appointement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointement.destroy
    respond_to do |format|
      format.html { redirect_to appointements_url, notice: 'Appointement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def report
    respond_to do |format|
      format.html
      format.pdf do
       render pdf: "#{@appointement.id}_report.pdf",
         template: 'appointements/report.html.erb', encoding: 'UTF-8'
      end
    end
  end
  
  def report_mail
    pdf_report = render_to_string pdf: 'report',
      template: 'appointements/report.html.erb', encoding: 'UTF-8'
    
    ReportMailer.patient_report(@appointement.patient, pdf_report ).deliver
    render nothing: true
  end

  private
    def set_appointement
      @appointement = Appointement.find(params[:id])
    end

    def appointement_params
      params.require(:appointement).permit(:patient_id, :description, 
        appointement_indicators_attributes: [:indicator_id, :result])
    end
end
