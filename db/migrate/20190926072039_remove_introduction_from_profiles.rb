class RemoveIntroductionFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :introduction, :text
  end
end
