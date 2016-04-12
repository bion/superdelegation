class Delegates::WA::Mcdermott
  attr_reader :message

  FORM_ACTION = "https://forms.house.gov/htbin/formproc_za/mcdermott/webforms/new/issue_subscribe_parm.txt&form=/mcdermott/webforms/new/issue_subscribe_verify.html"

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
    if page.body !~ /Your email should automatically be sent in a few seconds./
      raise Delegates::SubmissionError,
        "Could not submit to Jim McDermott, page body: #{page.body}"
    end
  end

  def set_form_fields
    form['required-first'] = message.first_name
    form['required-last'] = message.last_name
    form['required-email_address'] = message.email
    form['required-address'] = message.address1
    form['required-city'] = message.city
    form['required-state'] = 'WA'

    form['required-phone'] = message.phone
    form['required-zip5'] = message.zip
    form['zip4'] = message.zip_extension
    form['required-issue'] = 'ELECTIONS'
    form['required-message'] = message.contents
  end


  def form
    @form ||= Mechanize
      .new
      .tap { |agent| agent.redirect_ok = true }
      .get('https://forms.house.gov/mcdermott/webforms/new/contact.shtml')
      .forms
      .select { |form| form.action == FORM_ACTION }
      .first
  end
end
