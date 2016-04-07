class Delegates::WA::Larsen < Delegates::RepBase
  def form_url
    'http://larsen.house.gov/contact-rick'
  end

  def rep_name
    'Rick Larsen'
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
