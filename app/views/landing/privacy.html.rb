class Views::Landing::Privacy < Views::Base
  def content
    full_row do
      link_to "< Back", root_path

      h2 "Privacy Policy"
      p "This privacy policy has been compiled to better serve those
        who are concerned with how their 'Personally identifiable
        information' (PII) is being used online. PII, as used in US
        privacy law and information security, is information that can be
        used on its own or with other information to identify, contact,
        or locate a single person, or to identify an individual in
        context. Please read our privacy policy carefully to get a clear
        understanding of how we collect, use, protect or otherwise
        handle your Personally Identifiable Information in accordance
        with our website."

      h4 "What personal information do we collect from the people that
        visit our blog, website or app?"
      p "When ordering or registering on our site, as appropriate, you
        may be asked to enter your name, email address, mailing address,
        phone number or other details to help you with your experience."

      h4 "When do we collect information?"
      p "We collect information from you when you fill out a form or
        enter information on our site."

      h4 "How do we use your information?"
      p "We may use the information we collect from you when you
        register, make a purchase, sign up for our newsletter, respond
        to a survey or marketing communication, surf the website, or use
        certain other site features in the following ways:"

      ul do
        li "To quickly process your transactions."
        li "To send periodic emails regarding your order or other
          products and services."
        li "To follow up with them after correspondence (live chat,
          email or phone inquiries)"
      end

      h4 "How do we protect visitor information?"
      p "Our website is scanned on a regular basis for security holes
        and known vulnerabilities in order to make your visit to our
        site as safe as possible."
      p "We do not use Malware Scanning."

      p do
        text "We do not use an SSL certificate but you may visit the "
        link_to "base Heroku site to be under SSL.",
          "https://superdelegation.herokuapp.com/"
      end

      h4 "Do we use 'cookies'?"
      p "Yes. Cookies are small files that a site or its service
      provider transfers to your computer's hard drive through your
      Web browser (if you allow) that enables the site's or service
      provider's systems to recognize your browser and capture and
      remember certain information. For instance, we use cookies to
      help us remember and process the items in your shopping
      cart. They are also used to help us understand your preferences
      based on previous or current site activity, which enables us to
      provide you with improved services. We also use cookies to help
      us compile aggregate data about site traffic and site
      interaction so that we can offer better site experiences and
      tools in the future."

      p "We use cookies to:"
      ul do
        li "Understand and save user's preferences for future visits."
      end

      p "You can choose to have your computer warn you each time a
        cookie is being sent, or you can choose to turn off all
        cookies. You do this through your browser (like Internet
        Explorer) settings. Each browser is a little different, so look
        at your browser's Help menu to learn the correct way to modify
        your cookies."

      p "If you disable cookies off, some features will be disabled It
        won't affect the user's experience that make your site
        experience more efficient and some of our services will not
        function properly."

      h4 "Third-party disclosure"
      p "We do not sell, trade, or otherwise transfer to outside
        parties your personally identifiable information."

      h4 "Third-party links"
      p "We do not include or offer third-party products or services on our website."

      h4 "Google"
      p do
        text "Google's advertising requirements can be summed up by
          Google's Advertising Principles. They are put in place to
          provide a positive experience for users. "
        link_to "More information here.",
          "https://support.google.com/adwordspolicy/answer/1316548?hl=en",
          target: '__blank'
      end

      p "We have not enabled Google AdSense on our site but we may do so in the future."

      h4 "California Online Privacy Protection Act"
      p do
        text "CalOPPA is the first state law in the nation to require
          commercial websites and online services to post a privacy
          policy. The law's reach stretches well beyond California to
          require a person or company in the United States (and
          conceivably the world) that operates websites collecting
          personally identifiable information from California consumers
          to post a conspicuous privacy policy on its website stating
          exactly the information being collected and those individuals
          with whom it is being shared, and to comply with this
          policy. "
        link_to "More information here.",
          "http://consumercal.org/california-online-privacy-protection-act-caloppa/#sthash.0FdRbT51.dpuf",
          target: '__blank'
      end

      p "According to CalOPPA we agree to the following:"

      ul do
        li "Users can visit our site anonymously."
        li "Once this privacy policy is created, we will add a link to
          it on our home page or as a minimum on the first significant
          page after entering our website."
        li "Our Privacy Policy link includes the word 'Privacy' and
          can be easily be found on the page specified above."
      end

      p "Users will be notified of any privacy policy changes on our
        Privacy Policy Page"
      p "Users are able to change their personal information by emailing us"

      h4 "How does our site handle do not track signals?"
      p "We honor do not track signals and do not track, plant
        cookies, or use advertising when a Do Not Track (DNT) browser
        mechanism is in place."

      h4 "Does our site allow third-party behavioral tracking?"
      p "It's also important to note that we do not allow third-party
        behavioral tracking"

      h4 "COPPA (Children Online Privacy Protection Act)"
      p "When it comes to the collection of personal information from
        children under 13, the Children's Online Privacy Protection Act
        (COPPA) puts parents in control. The Federal Trade Commission,
        the nation's consumer protection agency, enforces the COPPA
        Rule, which spells out what operators of websites and online
        services must do to protect children's privacy and safety
        online."
      p "We do not specifically market to children under 13."

      h4 "Fair Information Practices"
      p "The Fair Information Practices Principles form the backbone
        of privacy law in the United States and the concepts they
        include have played a significant role in the development of
        data protection laws around the globe. Understanding the Fair
        Information Practice Principles and how they should be
        implemented is critical to comply with the various privacy laws
        that protect personal information."
      p "In order to be in line with Fair Information Practices we
        will take the following responsive action, should a data breach occur:"
      p "We will notify the users via email within 7 business days"
      p "We also agree to the Individual Redress Principle, which
        requires that individuals have a right to pursue legally
        enforceable rights against data collectors and processors who
        fail to adhere to the law. This principle requires not only that
        individuals have enforceable rights against data users, but also
        that individuals have recourse to courts or government agencies
        to investigate and/or prosecute non-compliance by data
        processors."

      h4 "CAN SPAM Act"
      p "The CAN-SPAM Act is a law that sets the rules for commercial
        email, establishes requirements for commercial messages, gives
        recipients the right to have emails stopped from being sent to
        them, and spells out tough penalties for violations."
      p "To be in accordance with CANSPAM we agree to the following:"
      p "If at any time you would like to unsubscribe from receiving
        future emails, you can email us at and we will promptly remove
        you from ALL correspondence."
      p "If there are any questions regarding this privacy policy you
        may contact us using the information below."

      p "Last Edited on 2016-04-10"
      link_to "< Back", root_path
    end
  end
end
