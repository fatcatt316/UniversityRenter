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
  
  def remove_child_link(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def add_child_link(name, f, method, options={})
    css_class = options[:class] || ""
    where = options[:where] || "before"
    fields = new_child_fields(f, method, {:partial => options[:partial]})
    link_to_function(name, h("insert_fields(this, \"#{method}\", \"#{escape_javascript(fields)}\", \"#{where}\")"), :class => css_class)
  end

  def new_child_fields(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :f
    form_builder.fields_for(method, options[:object], :child_index => "new_#{method}") do |f|
      render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
    end
  end
  
  ########### END Complex forms helpers END ##########
end
