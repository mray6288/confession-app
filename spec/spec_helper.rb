# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/dsl'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "default"
  config.include Capybara::DSL

  DatabaseCleaner.strategy = :truncation

  config.before(:each) do 
    @ray = User.create(username:'ray', password:'r',password_confirmation:'r')
    @barney = User.create(username:'barney', password:'b',password_confirmation:'b')
    @john = User.create(username:'john', password:'j',password_confirmation:'j')
    @jane = User.create(username:'jane', password:'j',password_confirmation:'j')

    @topic1 = Topic.create(name:'life-stuff')
    @topic2 = Topic.create(name:'funny')
    @topic3 = Topic.create(name:'sad')

    @confession1 = Confession.create(title:'My 8th Birthday Party',text:'I stole some cake and hid it in my room.',topics:[@topic1],user:@ray)
    @confession2 = Confession.create(title:'College Algebra',text:'I cheated on the final exam.',topics:[@topic1],user:@barney)
    @confession3 = Confession.create(title:'Girlfriend Left Me',text:'My girlfriend left me because I smell like a farm animal.',topics:[@topic3],user:@john)
    @confession4 = Confession.create(title:"Stole My Brother's Gameboy",text:"I took my brother's gameboy and blamed it on the neighbor and my parents bought him another one.",topics:[@topic2],user:@ray)
    @confession5 = Confession.create(title:"Lied To My Boyfriend",text:"I told my boyfriend I was leaving him because he smelled like a farm animal, but really it was because he's too gullible.",topics:[@topic2, @topic3],user:@jane)

    @comment1 = Comment.create(confession:@confession1,user:@jane,text:'What kind of cake was it')
    @comment2 = Comment.create(confession:@confession1,user:@john,text:'What kind of cake is your favorite jane')
    @comment3 = Comment.create(confession:@confession1,user:@barney,text:"I did the same thing at my nephew's birthday party last week")
    @comment4 = Comment.create(confession:@confession2,user:@john,text:'No one cares')
    @comment5 = Comment.create(confession:@confession3,user:@ray,text:'Get over it')
    @comment6 = Comment.create(confession:@confession5,user:@barney,text:'Did you know, being gullible is caused by breastfeeding')
    @comment7 = Comment.create(confession:@confession5,user:@john,text:'Wow I never knew that!')


  end

  config.after(:all) do 
    DatabaseCleaner.clean
  end
end
