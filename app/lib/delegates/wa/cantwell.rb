class Delegates::WA::Cantwell < Delegates::JSBase
  FORM_PATH = '/contact/email/form'

  def deliver!
    visit FORM_PATH

    select 'Mr.', from: 'Title*'
    fill_in 'First Name*', with: message.first_name
    fill_in 'Last Name*', with: message.last_name

    fill_in 'Street Address*', with: message.address1
    fill_in 'Street Address (2)', with: message.address2

    fill_in 'City*', with: message.city
    select 'WA', from: 'State*'
    fill_in 'Zip*', with: message.zip

    fill_in 'Phone Number*', with: message.phone
    fill_in 'Email*', with: message.email
    fill_in 'Verify Email*', with: message.email
    select 'Miscellaneous', from: 'Message Topic*'

    fill_in 'Please Write Your Message*', with: message.contents
    check 'I Would Like A Response From The Senator'
    uncheck 'Sign up for the e-Newsletter'

    click_button 'Submit'

    begin
      page.find 'p', text: 'Thank you for submitting your'
    rescue
      raise Delegates::SubmissionError,
        "Could not submit to Maria Cantwell, page body: #{page.text}"
    end

    nil
  end

  private

  def host
    'https://www.cantwell.senate.gov'
  end
end
