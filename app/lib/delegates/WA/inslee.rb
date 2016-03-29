class Delegates::WA::Inslee
  attr_reader :message

  DUMB_WA_STATE = '9227f6f4-cf63-e411-8d8b-005056ba7b6d' # lololol
  DUMB_OTHER_SUBJECT = '4f440443-d263-e411-8d8b-005056ba7b6d' # 'other' as opposed to 'abortion'

  def initialize(message)
    @message = message
  end

  def deliver
    set_form_fields
    form.click_button
  end

  def set_form_fields
    form['RSP'] = true
    form['First'] = message.first_name
    form['Last'] = message.last_name
    form['Addr1'] = message.address1
    form['Addr2'] = message.address2
    form['City'] = message.city
    form['Zip'] = message.zip
    form['Email'] = message.email
    form['Addr3'] = ''
    # needs to be in this format: ^(\s*|^[0-9() -x]+)$
    form['Phone'] = message.phone
    form['Country'] = 'USA'
    form['Msg'] = "<p class='textContainer'>#{message.contents}</p>"
    form['State'] = DUMB_WA_STATE
    form['SelectedSubject'] = DUMB_OTHER_SUBJECT
  end

  def form
    @form ||= Mechanize
      .new
      .get('https://fortress.wa.gov/es/governor/')
      .forms
      .select { |form| form.action == '/es/governor/' }
      .first
  end
end
