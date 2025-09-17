# frozen_string_literal: true

require "test_helper"

class RefsTest < Minitest::Test
  def ref = Refs.instance

  def test_it_defines_references
    Refs.define do
      ref :my_settings_form
    end
    assert_equal ref.my_settings_form, "my_settings_form"
  end

  def test_error_when_no_ref
    assert_raises do
      ref.this_is_not_here
    end
  end
end
