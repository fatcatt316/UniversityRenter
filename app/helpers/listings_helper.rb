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
    if listing.pending?
      "listing-pending"
    elsif listing.retired?
      "listing-retired"
    end
  end
  
  def listing_icon(listing)
    if listing.wanted?
      raw("<span class='listing-icon wanted'>Room Wanted</span>")
    else
      raw("<span class='listing-icon for-rent'>For Rent</span>")
    end
  end
  
  def listing_status(listing)
    if listing.denied?
      raw("<span class='listing-status denied' title='This ad has been denied.'>Denied</span>")
    elsif listing.pending?
      raw("<span class='listing-status pending' title='This ad is pending approval by an admin.'>Pending</span>")
    elsif listing.retired?
      raw("<span class='listing-status deleted' title='This ad has been deleted.'>Deleted</span>")
    end
  end
end
