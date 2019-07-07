defmodule CommunityWeb.Schema do
  use Absinthe.Schema

  alias CommunityWeb.NewsResolver

  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
  end

  query do
    @desc "Get a list of links"
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve &NewsResolver.all_links/3
    end

    @desc "Get a link by id"
    field :link, non_null(:link) do
      arg :id, non_null(:id)
      resolve &NewsResolver.get_link/3
    end
  end

  mutation do
    field :create_link, :link do
      arg :url, non_null(:string)
      arg :description, non_null(:string)

      resolve &NewsResolver.create_link/3
    end
  end
end