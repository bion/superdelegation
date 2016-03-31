# SUPERDELEGATION

## Getting Started
0. Clone the repo and cd into it
1. Install [rbenv](https://github.com/rbenv/rbenv#installation)
2. Install ruby 2.2.2 `rbenv install 2.2.2`
3. Install bundler `gem install bundler`
4. **On OSX** `brew install libxml2 libxslt libiconv`
5. **ON OSX** `gem install nokogiri -v '1.6.7.2' -- --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/libxml2 --use-system-libraries`
6. Install your gems `bundle`
7. Install zeus `gem install zeus`
8. Install postgres (excercise for the reader)
9. Create your database `rake db:create`
10. Perform your migrations `rake db:migrate`
11. Seed your data `rake db:seed`
12. Prepare your test db `rake db:test:prepare`

After installation:
`zeus start`
From another terminal, run `zeus server` to start a test server or run `zeus test` to run tests.

## Adding your first delegate!
1. If it's a new state, create a new directory in `app/lib/delegates/` wtih the state's 2 letter acronym **in lowercase**
2. Do the same thing under `spec/lib/delegates`
3. Create `app/lib/delegates/<state>/<last_name>.rb and implement the following class...
```rb
class Delegates::WA::Cantwell
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def deliver!
    # TODO: Implement mailer
    # raises Delegates::SubmissionError on error
    # returns nil on success
  end

end
```
This will run as a delayed_job (??????)
4. Create `spec/lib/delegates/<state>/<last_name>.rb and implement similar tests...
```rb
# TODO
```
5. Update `db/seeds.rb` with your superdelegate (just follow the pattern) and run `rake db:seed`
6. 
