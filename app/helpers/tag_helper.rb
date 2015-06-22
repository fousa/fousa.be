module TagHelper
  def logo_tag
    link_to root_path do
      url = 'https://fousa.herokuapp.com/assets/fousa-f8325619bc3079782d60103040fa3bdc.svg'
      image_tag url, class: 'logo', alt: 'Fousa'
    end
  end

  def next_paginator_tag date
    link_to home_path(date: date.next_quarter) do
      content = 'Next '
      content += content_tag(:span, '&rarr;'.html_safe)
      content.html_safe
    end
  end

  def previous_paginator_tag date
    link_to home_path(date: date.prev_quarter) do
      content = content_tag(:span, '&larr;'.html_safe)
      content += ' Previous'
      content
    end
  end

  def current_paginator_tag date
    link_to 'Current Quarter', home_path(date: date)
  end

  def back_tag
    link_to home_path do
      content = content_tag(:span, '&larr;'.html_safe)
      content += ' Back'
      content
    end
  end

  def add_invoice_tag
    link_to new_invoice_path, remote: true do
      content = content_tag :i, nil, class: 'glyphicon glyphicon-plus-sign'
      content << " Add invoice"
      content
    end
  end

  def add_expense_tag
    link_to new_expense_path, remote: true do
      content = content_tag :i, nil, class: 'glyphicon glyphicon-minus-sign'
      content << " Add expense"
      content
    end
  end
end
