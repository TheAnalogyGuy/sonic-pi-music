# Welcome to Sonic Pi
# Harley Davidson
puts "Harley"

use_debug false
load_samples :drum_heavy_kick

live_loop :drums do
  16.times do
    sample :drum_heavy_kick, rate: rrand(1.7, 1.09), amp: rrand(1, 9), pan: rrand(-1.0, 1.0)
    sleep choose([0.125,0.0625,0.0115,0.0625,0.155,0.12])
    
  end
  
  11.times do
    sample :drum_heavy_kick, rate: rrand(1.6, 1.1), amp: rrand(1, 6), pan: rrand(-1.0, 1.0)
    sleep choose([0.105,0.0525,0.01,0.0225,0.115,0.1])
  end
end

live_loop :drums2 do
  5.times do
    sample :drum_heavy_kick, rate: rrand(1.6, 1.1), amp: rrand(1, 9), pan: rrand(-1.0, 1.0)
    sleep choose([0.125,0.0725,0.015,0.0325,0.115,0.1])
  end
  
  2.times do
    sample :drum_heavy_kick, rate: rrand(1.6, 1.01), amp: rrand(1, 10), pan: rrand(-1.0, 1.0)
    sleep choose([0.105,0.0225,0.01,0.0125,0.115,0.1])
  end
  
end
