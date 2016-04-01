class Delegates::WA::Murray
  attr_reader :message

  FORM_URL = 'http://www.murray.senate.gov/public/index.cfm/contactme'
  STATE_WA_VAL = 'WA'
  TOPIC_ELECTIONS_VAL = 'ELCON'

  def initialize(message)
    @message = message
  end

  def deliver!
    set_form_fields
    page = form.click_button

    check_for_errors!(page)

    nil
  end

  private

  def check_for_errors!(page)
    if page.body !~ /Thank you for your message!/
      raise Delegates::SubmissionError,
        "Could not submit to Patty Murray, page body: #{page.body}"
    end
  end

  def set_form_fields
    form_values.each do |label_text, value|
      name = name_for(label_text)
      form[name] = value
    end
  end

  def name_for(label_text)
    page
      .labels
      .detect { |l| l.text == label_text }
      .node['for']
  end

  def form_values
    {
      'Prefix *' => ['Mr.', 'Ms.'].sample, # correct sometimes,
      'First Name *' => message.first_name,
      'Last Name *' => message.last_name,
      'Address *' => message.address1,
      'Address' => message.address2,
      'City *' => message.city,
      'State *' => STATE_WA_VAL,
      'Zip *' => message.zip,
      'Phone' => message.phone,
      'Email *' => message.email,
      'Topic *' => TOPIC_ELECTIONS_VAL,
      'Subject of your message *' => 'Lorem ipsum',
      'Your message:' => message.contents
    }
  end

  def form
    @form ||= page.form_with(action: FORM_URL, method: 'POST')
  end

  def page
    @page ||= Mechanize.new.get(FORM_URL)
  end
end
