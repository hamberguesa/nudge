require_relative '../models/model'
require 'clockwork'

include Clockwork

every(5.minutes, Worker.search_database)