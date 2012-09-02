module ListingsHelper
  def listings_header
    header = ""
    header << "#{current_college.address.city} " if current_college
    header << "Student Apartments"
    header << " near #{current_college}" if current_college
    return header
  end
end
