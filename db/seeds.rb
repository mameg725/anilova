# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Owner.create!(
	email: "anilova@gmail.com",
	password: "aaaaaa"
)

User.create!([
	{
	name: "Anilova",
	friendly_url: "anilova",
	introduction: "管理者用ユーザー",
	website: "http://18.216.190.125/",
	email: "anilova.user@gmail.com",
	password: "aaaaaa"
	},
	{
	name: "まめ",
	friendly_url: "mame",
	introduction: "にゃんこ最高！",
	email: "aaa@gmail.com",
	password: "111111"
	},
	{
	name: "ぽち",
	friendly_url: "pochi",
	introduction: "犬が好きです。",
	email: "bbb@gmail.com",
	password: "222222"
	},
	{
	name: "たま",
	friendly_url: "tama",
	introduction: "猫大好き。",
	email: "ccc@gmail.com",
	password: "333333"
	}]
)


