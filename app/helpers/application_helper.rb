module ApplicationHelper
  def sortable(column, title = column.titleize.capitalize)
    css_class = column == sort_column ? "#{sort_direction}" : nil
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, { :sort => column, :direction => direction }, :class => css_class
  end

  def tooltip(content, text, attribute = :name, show_empty = false)
    text = html_escape text unless text.html_safe? 

    if content.blank? or (content.respond_to? :exists? and not content.exists?)
      show_empty ? text : nil
    else
      ['<span class="tooltip">', text,

        # Paperclip
        if content.is_a? Paperclip::Attachment
          if content.styles.include? :thumb
            ['<img src="', content.url(:thumb), '" />'].join
          else
            ['<img src="', content, '" />'].join
          end

        # Collection
        elsif content.is_a? Array
          ['<div>', html_escape(content.collect(&attribute) * "\n"), '</div>'].join

        # Other
        else
          ['<div>', html_escape(content.to_s), '</div>'].join

        end, '</span>'].join.html_safe
    end
  end
end
