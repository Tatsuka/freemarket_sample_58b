class InitSchema < ActiveRecord::Migration[5.2]
  def up
    create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "name", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "name", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "ancestry"
    end
    create_table "categories_brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "category_id", null: false
      t.bigint "brand_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "user_id", null: false
      t.bigint "item_id", null: false
      t.text "content", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "credit_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "user_id", null: false
      t.string "card_number", null: false
      t.integer "security_code", null: false
      t.integer "expiry_year", null: false
      t.integer "expiry_month", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "item_id", null: false
      t.string "image", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "name", null: false
      t.integer "price", null: false
      t.text "detail", null: false
      t.integer "shipping_cost", null: false
      t.integer "shipping_fee_charge_to", null: false
      t.integer "shipping_from", null: false
      t.integer "shipping_days", null: false
      t.bigint "condition_id", null: false
      t.bigint "category_id", null: false
      t.bigint "trade_status_id", null: false
      t.bigint "brand_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "user_id", null: false
    end
    create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "avatar", null: false
      t.string "first_name_kana", null: false
      t.string "last_name_kana", null: false
      t.string "first_name_kanji", null: false
      t.string "last_name_kanji", null: false
      t.bigint "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.date "birthday", null: false
      t.text "introduction"
      t.string "phone_number", null: false
    end
    create_table "shipping_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "first_name_kana", null: false
      t.string "last_name_kana", null: false
      t.string "first_name_kanji", null: false
      t.string "last_name_kanji", null: false
      t.integer "postal_code", null: false
      t.bigint "prefecture_id", null: false
      t.string "city", null: false
      t.integer "block_number"
      t.string "building_name"
      t.integer "phone_number", null: false
      t.bigint "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "sns_credentials", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "user_id", null: false
      t.integer "uid", null: false
      t.integer "provider", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "transaction_partners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "buyer_id", null: false
      t.bigint "seller_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "transactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "status_id", null: false
      t.bigint "item_id", null: false
      t.bigint "transaction_partner_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "user_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "user_id", null: false
      t.bigint "prefecture_id", null: false
      t.string "city", null: false
      t.integer "block_number"
      t.string "building_name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "phone_number"
      t.string "first_name_kana", null: false
      t.string "last_name_kana", null: false
      t.string "first_name_kanji", null: false
      t.string "last_name_kanji", null: false
      t.string "postal_code", null: false
    end
    create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "nickname", null: false
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
