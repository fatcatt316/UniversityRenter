class ContactMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def email_community(community, from, subject, body)
    @subject = "UniversityRenter: #{subject}"
    @from = from
    @to = community.email
    @body["body"] = body
    @content_type = "text/html"
  end
  
  
end
