class ReportMailer < ApplicationMailer
  
  def patient_report(patient, report_attachment)
    attachments["appointement_report.pdf"] = report_attachment
    mail to: patient.email, subject: "#{patient.first_name} #{patient.last_name} Report"
  end

end
