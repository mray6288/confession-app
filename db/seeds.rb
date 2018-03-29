# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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