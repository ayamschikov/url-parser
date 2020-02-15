# frozen_string_literal: true

class ThreadPool
  def initialize(size)
    @size = size
    @jobs = Queue.new
    @pool = Array.new(@size) do
      Thread.new do
        catch(:exit) do
          loop do
            @jobs.pop.call
          end
        end
      end
    end
  end

  def schedule(&block)
    @jobs << block
  end

  def run!
    @size.times do
      schedule { throw :exit }
    end

    @pool.map(&:join)
  end
end
