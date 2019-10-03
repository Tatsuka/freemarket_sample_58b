# Image.create!(
#   item_id: 1,
#   image: open("#{Rails.root}/public/uploads/image/image/1/1.jpeg"))

lady = Category.create(:name=>"レディース")

lady_tops = lady.children.create(:name=>"トップス")
lady_jacket = lady.children.create(:name=>"ジャケット/アウター")

lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
lady_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])



mens = Category.create(:name=>"メンズ")

mens_tops = mens.children.create(:name=>"トップス")
mens_jacket = mens.children.create(:name=>"ジャケット/アウター")

mens_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
mens_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])



hobby = Category.create(:name=>"おもちゃ・ホビー・グッズ")

hobby_toys = hobby.children.create(:name=>"おもちゃ")
hobby_comic = hobby.children.create(:name=>"コミック/アニメグッズ")

hobby_toys.children.create([{:name=>"ぬいぐるみ"}, {:name=>"小物/アクセサリー"},{:name=>"その他"}])
hobby_comic.children.create([{:name=>"キーホルダー"}, {:name=>"カード"}, {:name=>"ポスター"},{:name=>"タオル"}])



home_appliance = Category.create(:name=>"おもちゃ・ホビー・グッズ")

home_appliance_phone = home_appliance.children.create(:name=>"おもちゃ")
home_appliance_camera = home_appliance.children.create(:name=>"コミック/アニメグッズ")

home_appliance_phone.children.create([{:name=>"スマートフォン本体"}, {:name=>"バッテリー/充電器"},{:name=>"その他"}])
home_appliance_camera.children.create([{:name=>"デジタルカメラ"}, {:name=>"ビデオカメラ"}, {:name=>"防犯カメラ"},{:name=>"レンズ"}])

