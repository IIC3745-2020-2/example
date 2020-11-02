# ## Schema Information
#
# Table name: `repositories`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`created_at`**  | `datetime`         | `not null`
# **`full_name`**   | `string`           | `not null, indexed`
# **`id`**          | `bigint(8)`        | `not null, primary key`
# **`name`**        | `string`           | `not null, indexed`
# **`updated_at`**  | `datetime`         | `not null`
# **`url`**         | `string`           | `not null, indexed`
#
# ### Indexes
#
# * `index_repositories_on_full_name` (_unique_):
#     * **`full_name`**
# * `index_repositories_on_name` (_unique_):
#     * **`name`**
# * `index_repositories_on_url` (_unique_):
#     * **`url`**
#
class Repository < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :full_name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  has_many :commits, dependent: :destroy
end
