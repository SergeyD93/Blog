module ArticlesHelper

  def render_article(article)

    concat image_tag (User.find_by_id(article.user_id).avatar_link), width: 20, height: 20
    concat (' ')
    concat User.find_by_id(article.user_id).login
    concat (' ')
    concat link_to article.title, article_path(article) , class: "article_title"

    if current_user && article.user_id == current_user.id
      concat link_to 'Edit', edit_article_path(article)
      concat (' ')
      concat link_to 'Destroy', article_path(article),
                        method: :delete,
                        id: article.id,
                        data: { confirm: 'Are you sure?',
                                :remote => true}
    end
  end
end
