require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "should not save event without name" do 
  	event = Event.new
  	assert_not event.save , "Création de l'évènement sans nom"
  end
end
