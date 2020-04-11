require 'benchmark'
require_relative "robot_name"

n = 26 * 26 * 1000
Benchmark.bmbm do |x|
  x.report("Robot2") { 1.upto(n) do ; Robot2.new; end }
  x.report("Robot1") { 1.upto(n) do ; Robot.new; end }
end;0
