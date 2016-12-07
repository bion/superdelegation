[![Build Status](https://travis-ci.org/bion/superdelegation.svg?branch=master)](https://travis-ci.org/bion/superdelegation)

# SUPERDELEGATION

## Getting Started
0. Clone the repo and cd into it
1. Install [rbenv](https://github.com/rbenv/rbenv#installation) or [rvm](https://rvm.io/rvm/install)
2. Install ruby 2.2.2 `rbenv install 2.2.2`
3. Install bundler `gem install bundler`
4. **On OSX** `brew install libxml2 libxslt libiconv`
5. **ON OSX** `gem install nokogiri -v '1.6.7.2' -- --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/libxml2 --use-system-libraries`
6. Install your gems `bundle`
7. Install zeus `gem install zeus`
8. Install postgres (I'll leave this as an exercise for the reader)
9. Create an .envrc file for loading private configuration information `cp .envrc.example .envrc`
10. Create your database `rake db:create`
11. Perform your migrations `rake db:migrate`
12. Seed your data `rake db:seed`
13. Prepare your test db `rake db:test:prepare`

After installation:
`zeus start`
From another terminal, run `zeus server` to start a test server or run
`zeus test` to run tests.

## Contributing

* Fork it and create a branch from `master`
* Test the code you contribute.
* **Wrap your delegate test cases in `VCR.use_cassette...` to avoid
spamming delegates every time you run the test.**
* Make a github issue if you have questions or encounter bugs
* Make a pull request when your contribution is ready

### Adding a new delegate

Messages are sent to delegates via webforms. To add a new delegate,
find their contact page, then implement a class with two public
methods: `def initialize(message)` and `def deliver!`. `message` will
be an instance of [`Message`](https://github.com/bion/superdelegation/blob/master/app/models/message.rb) Your class
should throw an error if it fails to send the message, and return `nil`
if it succeeds.

All classes for contacting reps must use the `def agent` method provided by
including `include Delegates::Agent` in your class (unless the page
requires JavaScript in which case see below). `agent` returns a
[Mechanize](https://github.com/sparklemotion/mechanize) instance that
can be used to drive interaction with the page. See the
[`Delegates::WA::Murray`](https://github.com/bion/superdelegation/blob/master/app/lib/delegates/wa/murray.rb)
class as an example and the
[Mechanize docs](http://mechanize.rubyforge.org/EXAMPLES_rdoc.html)
for more information.

#### U.S. Representatives

Reps almost all use basically the same website with a multi-step form
requiring zip code confirmation before the user can submit the
actual message. For these your class should inherit from
[`Delegates::RepBase`](https://github.com/bion/superdelegation/blob/master/app/lib/delegates/rep_base.rb)
and override protected methods as needed &mdash; usually just `def form_url`,
`def rep_name`, and `def set_form_fields`.

#### Forms requiring JavaScript

Some delegates have contact forms that are handled using JavaScript.
For these your class should inherit from
[`Delegates::JSBase`](https://github.com/bion/superdelegation/blob/master/app/lib/delegates/js_base.rb),
which provides a [Capybara](https://github.com/jnicklas/capybara)
session running in [Phantomjs](https://github.com/ariya/phantomjs)
accessible via the `def session` method. See the
[`Delegates::WA::Cantwell`](https://github.com/bion/superdelegation/blob/master/app/lib/delegates/wa/cantwell.rb)
class for an example.

**Do not use the `JSBase` class unless the site you are dealing with
necessitates it.**

VCR cannot intercept HTTP requests from Phantomjs, so your test will
make an actual form submission to the delegate every time it runs
(assuming it works properly). For this reason, include the
`:live_test` tag in the `describe` block of your test for the class, so
that it won't run on CI and normal test suite runs. See the
[`cantwell_spec.rb`](https://github.com/bion/superdelegation/blob/master/spec/lib/delegates/wa/cantwell_spec.rb)
for an example.

## Contributors

* Andrew Jacobson [@andyjac](https://github.com/andyjac)
* Bion Johnson [@bion](https://github.com/bion)
* David Balatero [@dbalatero](https://github.com/dbalatero)
* Heather Moore [@heatherm](https://github.com/heatherm)
* Heather Perry [@southernzen](https://github.com/southernzen)
* Jacob Reynolds [@jereynolds](https://github.com/jereynolds)
* Philip Bjorge [@philipbjorge](https://github.com/philipbjorge)
