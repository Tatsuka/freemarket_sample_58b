class AddIntroductionToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :introduction, :text
  end
end
