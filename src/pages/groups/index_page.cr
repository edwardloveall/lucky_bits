class Groups::IndexPage < MainLayout
  needs groups : GroupQuery

  private def page_title
    "My Groups"
  end

  def content
    h2 "Groups"
    section class: "section" do
      link "New Group", to: Groups::New, flow_id: "new-group"
    end
    group_links(groups)
    bookmarklets(groups)
  end

  private def group_links(groups : GroupQuery)
    section class: "section" do
      ul do
        groups.each do |group|
          li class: "group" do
            link group.title, to: Groups::Bits::Index.with(group), flow_id: "group-title"
          end
        end
      end
    end
  end

  private def bookmarklets(groups : GroupQuery)
    section class: "bookmarklets section" do
      h2 "Bookmarklets"
      mount Groups::BookmarkletDescription.new

      ul do
        groups.each do |group|
          li class: "bookmarklet" do
            mount Groups::Bookmarklet.new(group)
          end
        end
      end
    end
  end
end
