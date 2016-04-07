class Delegates::WA::Heck < Delegates::RepBase
  def form_url
    'https://dennyheck.house.gov/contact'
  end

  def rep_name
    'Denny Heck'
  end

  def set_form_fields(page)
    form = page.form_with(class: 'validate wsbform', method: 'POST')

    form['required-first'] = message.first_name
    form['required-last'] = message.last_name
    form['required-address'] = message.address1
    form['address2'] = message.address2
    form['required-city'] = message.city
    form['required-valid-email'] = message.email
    form['required-phone'] = message.phone
    form['required-subject'] = 'Superdelegate'
    form['required-message'] = message.contents
    form['required-response'] = 'Y'

    form
  end

  def check_for_errors!(page)
    if page.body !~ /The following information has been submitted/
      raise Delegates::SubmissionError,
        "Could not submit to #{rep_name}, page body: #{page.body}"
    end
  end

  def check_for_zip_errors!(page)
    if page.body =~ /Zip Code Authentication Failed/
      raise Delegates::SubmissionError,
        "Could not submit to #{rep_name}, page body: #{page.body}"
    end
  end
end
