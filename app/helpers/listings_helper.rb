module ListingsHelper
  def listings_header
    header = ""
    header << "#{current_college.address.city} " if current_college
    header << "Student Apartments"
    header << " near #{current_college.short_name}" if current_college
    return header
  end
  
  def spam_prevention_field(f)
    f.text_field :full_name, autocomplete: :off, style: "display: none;"
  end
  
  def listing_class(listing)
    "listing-pending" if listing.pending?
  end
  
  def listing_icon(listing)
    if listing.wanted?
      raw("<span class='listing-icon wanted'>Room Wanted</span>")
    else
      raw("<span class='listing-icon for-rent'>For Rent</span>")
    end
  end
end
