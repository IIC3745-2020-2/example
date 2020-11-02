# frozen_string_literal: true

# ## Schema Information
#
# Table name: `commits`
#
# ### Columns
#
# Name                 | Type               | Attributes
# -------------------- | ------------------ | ---------------------------
# **`created_at`**     | `datetime`         | `not null`
# **`id`**             | `bigint(8)`        | `not null, primary key`
# **`message`**        | `string`           | `not null`
# **`pushed_at`**      | `integer`          | `not null`
# **`pusher`**         | `string`           | `not null`
# **`ref`**            | `string`           | `not null`
# **`repository_id`**  | `bigint(8)`        | `not null, indexed`
# **`sha`**            | `string`           | `not null, indexed`
# **`updated_at`**     | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_commits_on_repository_id`:
#     * **`repository_id`**
# * `index_commits_on_sha` (_unique_):
#     * **`sha`**
#
class Commit < ApplicationRecord
  validates :sha, presence: true, uniqueness: true
  validates :message, presence: true
  validates :pusher, presence: true
  validates :ref, presence: true

  belongs_to :repository, optional: false
end
