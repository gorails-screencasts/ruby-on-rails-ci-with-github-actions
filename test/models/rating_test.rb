require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "valid if score is between 0 and 10" do
    0.upto(10).each do |i|
      rating = Rating.new(score: i)
      rating.valid?
      assert_empty rating.errors[:score]
    end
  end

  test "invalid if score is less than 0" do
    rating = Rating.new(score: -1)
    rating.valid?
    assert_not rating.errors[:score].empty?
  end

  test "invalid if score is greater than 10" do
    rating = Rating.new(score: 11)
    rating.valid?
    assert_not rating.errors[:score].empty?
  end

  test "promoter? returns true if score is 9 or 10" do
    9.upto(10).each do |i|
      rating = Rating.new(score: i)
      assert rating.promoter?
    end
  end

  test "promoter? returns false if score is less than 9" do
    rating = Rating.new(score: 1)
    assert_not rating.promoter?
  end

  test "promoter? returns false if score is greater than 10" do
    rating = Rating.new(score: 11)
    assert_not rating.promoter?
  end

  test "passive? returns true if score is 7 or 8" do
    7.upto(8).each do |i|
      rating = Rating.new(score: i)
      assert rating.passive?
    end
  end

  test "passive? returns false if score is less than 7" do
    0.upto(6).each do |i|
      rating = Rating.new(score: i)
      assert_not rating.passive?
    end
  end

  test "passive? returns false if score is greater than 8" do
    9.upto(10).each do |i|
      rating = Rating.new(score: i)
      assert_not rating.passive?
    end
  end

  test "detractor? returns true if score is less than or equal to 6" do
    0.upto(6).each do |i|
      rating = Rating.new(score: i)
      assert rating.detractor?
    end
  end

  test "detractor? returns false if score is greater than 6" do
    7.upto(10).each do |i|
      rating = Rating.new(score: i)
      assert_not rating.detractor?
    end
  end

  test "detractor? returns false if score is less than 0" do
    rating = Rating.new(score: -1)
    assert_not rating.detractor?
  end

  test "update person score cache when created" do
    person = people(:one)
    assert_enqueued_with(job: UpdatePersonJob, args: [person.id, 9]) do
      person.ratings.create(score: 9)
    end
    perform_enqueued_jobs
    assert_equal 9, person.reload.score
    assert_performed_jobs 1
  end
end
