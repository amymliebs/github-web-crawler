class Api::V1::RepositorySerializer < ActiveModel::RepositorySerializer
  attributes :id, :name, :description, :language, :contributors
end
