

meetup_info = [
  { name: 'Dog Lovers', description: 'Dogs of all breeds welcome!', location: '77 Summer Street', date: '2017-09-27', time: '08:00:00' },
  { name: 'Cat Lovers', description: 'Cats of all breeds welcome!', location: '88 Winter Street', date: '2017-09-28', time: '09:00:00' },
  { name: 'Hamster Lovers', description: 'Hamsters of all breeds welcome!', location: '99 Autumn Street', date: '2017-09-29', time: '10:00:00' },
]

meetup_info.each do |attributes|
  Meetup.create(attributes)
end



user_info = [
  { provider: 'github', uid: '1', username: 'btramer', email: 'btramer@launch.com', avatar_url: 'http://orig15.deviantart.net/c487/f/2011/182/8/8/platypus_whoaaa_by_rey_of_sunlight-d3kpg53.png' },
  { provider: 'github', uid: '2', username: 'kbrown', email: 'kbrown@launch.com', avatar_url: 'http://orig15.deviantart.net/c487/f/2011/182/8/8/platypus_whoaaa_by_rey_of_sunlight-d3kpg53.png' },
  { provider: 'github', uid: '3', username: 'syoung', email: 'syoung@launch.com', avatar_url: 'http://orig15.deviantart.net/c487/f/2011/182/8/8/platypus_whoaaa_by_rey_of_sunlight-d3kpg53.png' },
]

user_info.each do |attributes|
  User.create(attributes)
end

meetup_user_info = [
  { meetup_id: 1, user_id: 1 },
  { meetup_id: 2, user_id: 1 },
  { meetup_id: 3, user_id: 1 },
  { meetup_id: 1, user_id: 2 },
  { meetup_id: 2, user_id: 2 },
  { meetup_id: 3, user_id: 3 },
  { meetup_id: 2, user_id: 3 },
]

meetup_user_info.each do |attributes|
  MeetupUsers.create(attributes)
end
