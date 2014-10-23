require 'clockwork'

include Clockwork

every(5.minutes, 'Queueing job') { Delayed::Job.enqueue IntervalJob.new }
