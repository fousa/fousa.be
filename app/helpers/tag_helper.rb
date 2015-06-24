module TagHelper
  def logo_tag
    link_to root_path do
      url = 'https://fousa.herokuapp.com/assets/fousa-f8325619bc3079782d60103040fa3bdc.svg'
      image_tag url, class: 'logo', alt: 'Fousa'
    end
  end

  def ladda_button_tag(text)
    data = { style: 'expand-right', 'spinner-size' => '30px' }
    content_tag :button, class: 'btn btn-success ladda-button', type: :submit, data: data do
      content_tag :span, text, class: 'ladda-label'
    end
  end

  def next_paginator_tag date
    link_to quarter_path(date: date.next_quarter) do
      content = "#{format_quarter_date(date.next_quarter)} "
      content += content_tag(:span, '&rarr;'.html_safe)
      content.html_safe
    end
  end

  def previous_paginator_tag date
    link_to quarter_path(date: date.prev_quarter) do
      content = content_tag(:span, '&larr;'.html_safe)
      content += " #{format_quarter_date(date.prev_quarter)}"
      content
    end
  end

  def current_paginator_tag date
    link_to format_quarter_date(date), quarter_path(date: date)
  end

  def back_tag
    link_to quarter_path do
      content = content_tag(:span, '&larr;'.html_safe)
      content += ' Back'
      content
    end
  end

  def quarters_tag
    link_to quarter_path do
      content = content_tag :i, nil, class: 'glyphicon glyphicon-list'
      content << " Quarters"
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

  def export_tag path, icon='file'
    link_to path do
      content_tag :i, nil, class: "glyphicon glyphicon-#{icon}"
    end
  end

  def edit_tag path, options
    link_to path, options do
      content_tag :i, nil, class: 'glyphicon glyphicon-edit'
    end
  end

  def delete_tag path, options
    link_to path, options do
      content_tag :i, nil, class: 'glyphicon glyphicon-trash'
    end
  end
end
