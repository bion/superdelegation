class Delegates::WA::Murray
  attr_reader :message

  FORM_URL = 'http://www.murray.senate.gov/public/index.cfm/contactme'

  STATE_FIELD_NAME = 'field_666B0565-90BC-4FBA-99BB-1D4EC09FCC6E'
  STATE_WA_VAL = 'WA'

  PREFIX_FIELD_NAME = 'field_B104BE44-176D-4CD9-9FDA-DBCBAEB5AAF9'
  SUBJECT_FIELD_NAME = 'field_250A9CB8-13DC-40F7-94FB-D301593DB4C9'

  TOPIC_FIELD_NAME = 'field_58409530-3430-4481-9B78-4434BD9620EB'
  TOPIC_ELECTIONS_VAL = 'ELCON'

  FIELD_NAMES = {
    first_name: 'field_D63BDCDE-A04C-4ECC-A644-F224BE0854F5',
    last_name: 'field_ADE71885-03E5-482F-A2A9-D7A3436BBD32',
    address1: 'field_CC02A0B7-1663-41B2-8B89-AB05498D3EED',
    address2: 'field_C8F81223-F4A8-4C04-8DE5-9530CDC95079',
    city: 'field_5A2C4A60-5CA8-476B-B29B-414A7F6934FE',
    zip: 'field_53D3B15C-3710-44B7-B6CD-731DAB06BC92',
    phone: 'field_5A8CFD28-F121-4B4E-A8E7-BDD361D8BFE4',
    email: 'field_654CAEAA-E603-4A35-8210-B2DAC7D95E51',
    contents: 'field_5722C424-8601-4ABF-A8D1-AC11B9C45F87'
  }

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
    form[PREFIX_FIELD_NAME] = ['Mr.', 'Ms.'].sample # correct sometimes
    form[STATE_FIELD_NAME] = STATE_WA_VAL
    form[TOPIC_FIELD_NAME] = TOPIC_ELECTIONS_VAL
    form[SUBJECT_FIELD_NAME] = 'Democratic party superdelegate'

    FIELD_NAMES.each do |k, v|
      form[v] = message.public_send(k)
    end
  end

  def form
    @form ||= Mechanize
      .new
      .get(FORM_URL)
      .forms
      .detect { |form| form.action == FORM_URL && form.method == 'POST' }
  end
end
