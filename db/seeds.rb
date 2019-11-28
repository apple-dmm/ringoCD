# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@admin',
   password: 'adminadmin'
   )

Artist.create!([
	{ name: 'ももいろクローバーZ' },
	{ name: 'ＡＫＢ４８' },
	{ name: '嵐' },
	{ name: '椎名林檎' },
	{ name: 'フレデリック' },
	{ name: '凛として時雨' },
	{ name: 'ぼくのりりっくのぼうよみ' },
	{ name: 'LiSA' },
	{ name: '04Limited Sazabys' },
	{ name: 'THE ORAL CIGARETTES' },
	{ name: 'TWICE' },
	{ name: 'EXO' },
	{ name: 'BLACKPINK' },
	{ name: 'ZOC' },
	{ name: 'ITZY' },
	{ name: '宇多田ヒカル' },
	{ name: '東京事変' },
	{ name: 'Co Shu Nie' },
	{ name: 'BTS' },
])

Label.create!([
	{ name: 'キングレコード' },
	{ name: 'ジェイ・ストーム' },
	{ name: 'ユニバーサル ミュージック' },
	{ name: 'A-Sketch' },
	{ name: 'ソニー・ミュージック' },
	{ name: 'ビクターエンタテインメント' },
	{ name: 'SACRA MUSIC' },
	{ name: '日本コロムビア' },
	{ name: 'ワーナーミュージック・ジャパン' },
	{ name: 'エイベックス・トラックス' },
	{ name: 'エピックレコードジャパン' },
	{ name: 'EMIミュージック・ジャパン' },
	{ name: 'ソニー・ミュージックアソシエイテッドレコーズ' },
	{ name: 'ユニバーサル ミュージック' },
])

Category.create!([
	{ name: 'J-pop' },
	{ name: 'K-pop' },
])

Item.create!([
	{ name: 'サラバ、愛しき悲しみたちよ',
	  price: '1160',
	  artist_id: '1',
	  label_id: '1',
	  category_id: '1',
	  release: '20121121'
	},
	{ name: '希望的リフレイン',
	  price: '1600',
	  artist_id: '2',
	  label_id: '1',
	  category_id: '1',
	  release: '20141126'
	},
	{ name: 'BRAVE',
	  price: '800',
	  artist_id: '3',
	  label_id: '2',
	  category_id: '1',
	  release: '20190911'
	},
	{ name: '果てない空',
	  price: '1500',
	  artist_id: '3',
	  label_id: '2',
	  category_id: '1',
	  release: '20101110'
	},
	{ name: 'ニュートンの林檎 ～初めてのベスト盤～',
	  price: '3600',
	  artist_id: '4',
	  label_id: '3',
	  category_id: '1',
	  release: '20191113'
	},
	{ name: 'フレデリズム２',
	  price: '3000',
	  artist_id: '5',
	  label_id: '10',
	  category_id: '1',
	  release: '20190220'
	},
	{ name: 'Neighbormind/lazer beamer',
	  price: '1500',
	  artist_id: '6',
	  label_id: '11',
	  category_id: '1',
	  release: '20190703'
	},
	{ name: 'hollow world',
	  price: '2500',
	  artist_id: '7',
	  label_id: '4',
	  category_id: '1',
	  release: '20151216'
	},
	{ name: '紅蓮華',
	  price: '1600',
	  artist_id: '8',
	  label_id: '7',
	  category_id: '1',
	  release: '20190703'
	},
	{ name: 'SOIL',
	  price: '2780',
	  artist_id: '9',
	  label_id: '8',
	  category_id: '1',
	  release: '20181010'
	},
	{ name: 'Before Its Too Late',
	  price: '3000',
	  artist_id: '10',
	  label_id: '9',
	  category_id: '1',
	  release: '20190828'
	},
	{ name: 'FANCY YOU',
	  price: '2000',
	  artist_id: '11',
	  label_id: '10',
	  category_id: '2',
	  release: '20190503'
	},
	{ name: 'XOXO',
	  price: '3200',
	  artist_id: '12',
	  label_id: '11',
	  category_id: '2',
	  release: '20130809'
	},
	{ name: 'KILL THIS LOVE',
	  price: '2800',
	  artist_id: '13',
	  label_id: '12',
	  category_id: '2',
	  release: '20191016'
	},
	{ name: '断捨離彼氏',
	  price: '1500',
	  artist_id: '14',
	  label_id: '11',
	  category_id: '1',
	  release: '20191009'
	},
	{ name: 'ICY',
	  price: '2750',
	  artist_id: '15',
	  label_id: '5',
	  category_id: '2',
	  release: '20190729'
	},
	{ name: 'First Love',
	  price: '3204',
	  artist_id: '16',
	  label_id: '7',
	  category_id: '1',
	  release: '19990310'
	},
	{ name: 'スポーツ',
	  price: '3500',
	  artist_id: '17',
	  label_id: '5',
	  category_id: '1',
	  release: '20100224'
	},
	{ name: 'bullet',
	  price: '1300',
	  artist_id: '18',
	  label_id: '4',
	  category_id: '1',
	  release: '20191120'
	},
	{ name: 'Lights/Boy With Luv',
	  price: '1700',
	  artist_id: '19',
	  label_id: '4',
	  category_id: '2',
	  release: '20190703'
	}
])