crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_top_path
  parent :root
end

crumb :credit do
  link "支払い方法", mypage_credit_index_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", mypage_profile_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", mypage_identification_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", mypage_logout_path
  parent :mypage
end

crumb :listing do
  link "出品した商品 - 出品中",  mypage_listings_listing_of_items_in_progress_path
  parent :mypage
end

crumb :compilation do
  link "出品商品画面",  mypage_listings_show_listing_of_items_on_sale_path
  parent :listing
end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).