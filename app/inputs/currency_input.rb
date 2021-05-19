class CurrencyInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    currency = options.delete(:currency) || default_currency
    # por enquanto esse autonumeric não está fazendo nada por conta do javascript estar meio zoneado
    input_options = input_html_options.merge({data: {autonumeric: {aSign: 'USD ', mDec: 2}}})
    merged_input_options = merge_wrapper_options(input_options, wrapper_options)

    content_tag(:div, input_group(currency, merged_input_options), class: "input-group")
  end

  private

  def input_group(currency, merged_input_options)
    "#{currency_addon(currency)} #{@builder.text_field(attribute_name, merged_input_options)}".html_safe
  end

  def currency_addon(currency)
    content_tag(:span, currency, class: "input-group-addon")
  end

  def default_currency
    "$"
  end
end