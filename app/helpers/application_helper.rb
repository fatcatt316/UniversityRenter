module ApplicationHelper
  
  # TODO: Better SEO
  def show_title
    return "TITLE FIX ME"
    yield(:title) || controller.controller_name.titleize + ' ' + controller.action_name.titleize
  end
  
  
  def show_primary_image(owner, options={})
    options[:size] ||= "thumb"
    image_file = owner.primary_document
    
    if image_file && image_file.image?
      return image_tag image_file.doc.url(options[:size].to_sym), :title => image_file.to_s, :class => "picture_frame"
    end
  end
  
  ### TODO: Have link somewhere for icons: http://p.yusukekamiyamane.com
  
  
  def line_break(string)
    return (h string).gsub("\n", '<br />') rescue ""
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
