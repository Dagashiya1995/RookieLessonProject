# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0

User.create(name: '植勇希',
            password: Digest::SHA256.hexdigest('hogehoge'),
            grade: 'semi2014',
            snum: '14T212',
            account: 'ueyuki',
            password_confirmation: Digest::SHA256.hexdigest('hogehoge'),
            is_admin: true
           )
User.create(name: '石井玲央',
            password: Digest::SHA256.hexdigest('hogehoge'),
            grade: 'semi2014',
            snum: '14T206',
            account: 'ishiireo',
            password_confirmation: Digest::SHA256.hexdigest('hogehoge'),
            is_admin: false
            )

end

if SubjectPage.count == 0
  SubjectPage.create(title: "ue0",
                     body: "hoge",
                     user_id: 1
                    )
  SubjectPage.create(title: "ue1",
                     body: "hoge",
                     user_id: 1
                    )
  SubjectPage.create(title: "ishii0",
                     body: "hoge",
                     user_id: 2
                    )
  SubjectPage.create(title: "ishii",
                     body: "hoge",
                     user_id: 2
                    )
  SubjectPage.create(title: "tsuji0",
                     body: "hoge",
                     user_id: 3
                    )
  SubjectPage.create(title: "tsuji1",
                     body: "hoge",
                     user_id: 3
                    )
  
  
end
