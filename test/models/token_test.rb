# == Schema Information
#
# Table name: tokens
#
#  id              :integer          not null, primary key
#  key             :text
#  expires_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  tokenable_id    :integer
#  tokenable_type  :string
#  does_not_expire :boolean          default(FALSE)
#

require 'test_helper'

class TokenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
