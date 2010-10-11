module ApplicationHelper
  def sortable(column, title = column.titleize.capitalize)
    css_class = column == sort_column ? "#{sort_direction}" : nil
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, { :sort => column, :direction => direction }, :class => css_class
  end

  def tooltip(content, text, attribute = :name)
    text = html_escape text unless text.html_safe? 

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

      end, '</span>'].join.html_safe unless content.blank? or not content.exists?
  end
end
