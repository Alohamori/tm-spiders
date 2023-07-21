TEMPLATE = File.read 'template.gnuplot'
COLORS = %w[#b8d284 #bdbf79 #c4ad74 #cc9c72 #d38d71
            #d97d71 #de6e73 #e05f77 #d7517f #c0438c
            #a1369d #7b2bb4 #5223cf #271de6 #0218da]

File.open('data').each_line.with_index do |row, i|
  path = "#{'%02d' % i.succ}.svg"
  name, champ, ranks = row.chomp.split(?,, 3)

  tics, labs = 0, 'set for [i=1:8] paxis i label ""'
  tics, labs = 13, '' if i % 5 == 2 # middle contestant
  color = COLORS[i / 5]
  champ = %w[#000000 #0040ff][champ.to_i]

  IO.popen('gnuplot', 'w') do |io|
    io.puts TEMPLATE % [path, name, champ, tics, labs, ranks, color]
  end
end
