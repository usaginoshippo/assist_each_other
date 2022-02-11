class Content < ActiveHash::Base
  
  self.data = [
    { id: 1, name: '選択してください'},
    { id: 2, name: '食事'},
    { id: 3, name: '買い物'},
    { id: 4, name: '洗濯'},
    { id: 5, name: '掃除'},
    { id: 6, name: '除雪'},
    { id: 7, name: '排雪'},
    { id: 8, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :schedules

end
