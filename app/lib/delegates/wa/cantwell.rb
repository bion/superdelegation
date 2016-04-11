class Delegates::WA::Cantwell < Delegates::JSBase
  def deliver!
    session.visit host

    sleep 2

    begin
      session.select 'Mr.', from: 'Title*'
      session.fill_in 'First Name*', with: message.first_name
      session.fill_in 'Last Name*', with: message.last_name

      session.fill_in 'Street Address*', with: message.address1
      session.fill_in 'Street Address (2)', with: message.address2

      session.fill_in 'City*', with: message.city
      session.select 'WA', from: 'State*'
      session.fill_in 'Zip*', with: message.zip

      session.fill_in 'Phone Number*', with: message.phone
      session.fill_in 'Email*', with: message.email
      session.fill_in 'Verify Email*', with: message.email
      session.select 'Miscellaneous', from: 'Message Topic*'

      session.fill_in 'Please Write Your Message*', with: message.contents
      session.check 'I Would Like A Response From The Senator'
      session.uncheck 'Sign up for the e-Newsletter'

      session.click_button 'Submit'

      session.find 'p', text: 'Thank you for submitting your'
    rescue
      raise Delegates::SubmissionError,
        "Could not submit to Maria Cantwell, page body: #{session.text}"
    end

    nil
  end

  private

  def host
    'https://www.cantwell.senate.gov/contact/email/form'
  end
end
