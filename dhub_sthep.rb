# Title:  dhub sthep
# Author: TheAnalogyGuy
# Date:   2022-05-16
# Notes:  See https://sonic-pi.net/ to play the song

use_debug false
use_bpm 36

load_samples [:drum_heavy_kick, :drum_snare_soft]

w = 4
h = 2
dq = 1.5
q = 1
e = 0.5
s = 0.25

# HISS
live_loop :hiss_loop do
  sample :vinyl_hiss, amp: 0.5
  sleep sample_duration :vinyl_hiss
end

# every 13 times bigger loob

# 4.0 second loop
puts "First drums 2-seconds"
live_loop :drums1 do
  8.times do # 2 seconds
    sample :drum_heavy_kick, rate: 0.9, amp: rrand(2, 5), attack: rrand(0, 0.1), pan: rrand(-1.0, 1.0)
    sleep choose([0.25,0.125])
    #sleep 0.25
  end
  16.times do # 2 seconds
    sample :drum_heavy_kick, rate: 0.8, amp: rrand(2, 4), attack: rrand(0, 0.1), pan: rrand(-1.0, 1.0)
    sleep 0.125
  end
end

puts "second driving drum beat "
live_loop :drums2 do
  12.times do # 6 seconds
    sample :drum_heavy_kick, rate: 0.8, amp: rrand(2, 5), attack: rrand(0, 0.1), pan: rrand(-1.0, 1.0)
    sleep 0.5
  end
  8.times do # 0.5 seconds
    sample :drum_heavy_kick, rate: 0.8, amp: rrand(2, 5), attack: rrand(0, 0.1), pan: rrand(-1.0, 1.0)
    sleep 0.0625
  end
end

puts "drum beats"

live_loop :drums3 do
  1.times do
    4.times do
      sample :drum_cymbal_closed
      sleep 0.0625
      sample :drum_cymbal_closed
      sleep 0.0625
    end
    sample :drum_snare_hard
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.25
  end
  11.times do
    2.times do
      sample :drum_cymbal_closed
      sleep 0.25
    end
    sample :drum_snare_hard
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.25
  end
end

live_loop :drums4 do
  2.times do
    sample :drum_cymbal_pedal
    sleep 0.125
  end
  sleep 1.75
end

notes2 = (scale :c1, :minor_pentatonic, num_octaves: rrand(1,4)).shuffle

live_loop :techsaw2  do
  tick_reset
  t = choose([0.025,0.125])
  with_fx :bitcrusher do
    s = synth :prophet, note: :e3, sustain: rrand(0.3, 0.4), note_slide: t, release: rrand(0, 0.3), amp: 0.4
    64.times do
      control s, note: notes2.tick, amp: rrand(0.4, 0.8)
      sleep choose([0.25,0.125])
    end
  end
end

live_loop :techsaw, delay: 6 do
  4.times do
    use_synth :tech_saws
    16.times do
      play choose([:D4,:E4,:C5,:A4]), amp: rrand(0.2, 0.3)
      sleep 0.25
    end
    sleep 12
    use_synth :zawa
    8.times do
      play choose([:D4,:E4,:C5,:A4,:F4]), amp: rrand(0.1, 0.2)
      sleep 0.25
    end
    sleep 24
  end
  sleep choose([32,48])
end


live_loop :drums4, delay: 2 do
  sample :drum_bass_hard
  sleep 4
  sample :bass_dnb_f, release: rrand(1, 2), cutoff_slide: rrand(0, 2), cutoff: rrand(60, 100)
  sleep 4
end


puts "Random scratch and bits"
live_loop :drive do
  2.times do
    2.times do
      sample :vinyl_scratch
      sleep 0.5
    end
    8.times do
      sample :elec_plip
      sleep 0.125
    end
    sample :bass_dnb_f, release: rrand(1, 2), cutoff_slide: rrand(0, 2), cutoff: rrand(60, 100)
    sleep 12
    4.times do
      sample :elec_plip
      sleep 0.0625
    end
  end
  sleep 16
end

puts "synth"
live_loop :synths do
  puts "hollow synth"
  use_synth :dark_ambience
  with_fx :reverb, mix: rrand(0.2, 0.7) do
    live_loop :note1, delay: 3 do
      play choose([:D4,:E4]), attack: rrand(2, 15), release: rrand(1, 10), amp: 1.5
      sleep rrand(2, 8)
    end
    live_loop :note2, delay: 7 do
      play choose([:Fs4,:G4]), attack: rrand(2, 15), release: rrand(1, 10), amp: 2
      sleep rrand(4, 12)
    end
    live_loop :note3, delay: 9 do
      play choose([:A4, :Cs5]), attack: rrand(2, 15), release: rrand(1, 10), amp: 2
      sleep rrand(2, 8)
    end
    sleep 32
    puts "mod_fm synth"
    use_synth :mod_fm
    with_fx :reverb, mix: rrand(0.2, 0.7) do
      live_loop :note4, delay: 3 do
        play choose([:D4,:E4]), attack: rrand(2, 15), release: rrand(1, 10), amp: 0.2
        sleep rrand(2, 8)
      end
      live_loop :note5, delay: 9 do
        play choose([:Fs4,:G4]), attack: rrand(2, 15), release: rrand(1, 10), amp: 0.1
        sleep rrand(4, 12)
      end
      live_loop :note6, delay: 12 do
        play choose([:A4, :Cs5]), attack: rrand(2, 15), release: rrand(1, 10), amp: 0.1
        sleep rrand(4, 8)
      end
    end
  end
  sleep 32
end

notes = (scale :e1, :minor_pentatonic, num_octaves: rrand(1,4)).shuffle

live_loop :rerezzed, delay: 4 do
  tick_reset
  t = 0.0125
  sleep t
  with_fx :bitcrusher do
    s = synth :dsaw, note: :e3, sustain: 10, note_slide: t, release: rrand(0, 0.2), amp: 0.1
    128.times do
      control s, note: notes.tick, pan: rrand(-1.0, 1.0), amp: rrand(0.1, 0.2)
      sleep 0.125
    end
  end
  sleep 64
end
