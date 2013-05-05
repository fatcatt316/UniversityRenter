module ApplicationHelper
  
  # TODO: Better SEO
  def page_title
    title = "University Renter | "
    
    page_object = @listing || @community || current_college
    
    if page_object
      title << page_object.to_title
    else
      title << "Student Apartments, Subleases, and Roommates"
      title << controller.controller_name.titleize
    end
    return title
  end
  
  
  def meta_keywords
    keywords = [current_college.try(:name), "college student apartments", "off-campus townhomes", 
      current_college.try(:short_name), current_college.try(:city_state), "roommate", "sublease", "rent"]
    return keywords.compact.join(",")
  end
  
  
  def meta_description
    if current_college
      description = "#{current_college.short_name} student apartments and townhomes in #{current_college.city_state} to rent or sublease near #{current_college.name}"
    else
      description = "Off-campus college student apartments and townhomes to rent or sublease.  Find a roommate or a place to rent near your university."
    end
    return description
  end
  
  
  def show_primary_image(owner, options={})
    options[:size] ||= "thumb"
    image_file = owner.images.first #owner.primary_document
    
    if image_file.try(:image?)
      return image_tag image_file.doc.url(options[:size].to_sym), :title => image_file.to_s, :class => "picture_frame"
    end
  end
  
  ### TODO: Have link somewhere for icons: http://p.yusukekamiyamane.com
  
  
  def line_break(string)
    return raw((h string).gsub("\n", '<br />')) rescue ""
  end
  
  ########### Complex forms helpers ##########
  
  def add_child_link(name, f, association, options={})
    options[:class]   ||= "add_link"
    options[:where]   ||= "before"
    options[:partial] ||= "#{association.to_s.singularize}_fields"
    new_object = f.object.class.reflect_on_association(association).klass.new
    
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |nested_form|
      render(:partial => options[:partial], :locals => { :f => nested_form })
    end
        
    link_to_function(name, ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\", \"#{options[:where]}\")"), 
      :class => options[:class])
  end
  
  
  
  def remove_child_link(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  ########### END Complex forms helpers END ##########
end
