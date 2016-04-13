class Delegates::RepBase
  include Delegates::Agent

  attr_reader :message

  CATEGORY_VAL = 'CONG'

  def initialize(message)
    @message = message
  end

  def deliver!
    zip_form = set_zip_form_fields(start_page)
    main_page = zip_form.click_button
    check_for_zip_errors!(main_page)

    main_form = set_form_fields(main_page)
    final_page = main_form.click_button
    check_for_errors!(final_page)

    nil
  end

  protected

  def form_url
    raise NotImplementedError
  end

  def rep_name
    raise NotImplementedError
  end

  def set_form_fields(page)
    form = page.form_with(class: 'validate wsbform', method: 'POST')

    form['required-first'] = message.first_name
    form['required-last'] = message.last_name
    form['required-address'] = message.address1
    form['address2'] = message.address2
    form['required-city'] = message.city
    form['required-valid-email'] = message.email
    form['phone'] = message.phone
    form['required-issue'] = CATEGORY_VAL
    form['required-subject'] = 'Superdelegate'
    form['required-message'] = message.contents
    form['required-response'] = 'Y'

    form
  end

  def set_zip_form_fields(page)
    zip_form =  start_page.form_with(class: 'validate wsbform', method: 'POST')

    zip_form['required-zip5'] = message.zip
    zip_form['zip4'] = message.zip_extension

    zip_form
  end

  def check_for_errors!(page)
    if page.body !~ /The following information has been submitted/
      raise Delegates::SubmissionError,
        "Could not submit to Rick Larsen, page body: #{page.body}"
    end
  end

  def check_for_zip_errors!(page)
    if page.body =~ /Zip Code Authentication Failed/
      raise Delegates::SubmissionError,
        "Could not submit to Rick Larsen, page body: #{page.body}"
    end
  end

  def start_page
    @start_page ||= agent.get(form_url)
  end
end
