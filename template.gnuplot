set terminal svg enhanced font ",16" size 360,360
set output '%s'
set tmargin 2.5
set title "%s" offset 0,0.25 font "SpecialElite,22" tc '%s'
set spiderplot
set paxis 1 tics norangelimit 15 font ",%d"
set for [i=1:8] paxis i lw 0.4 range [ 0:75 ] noextend
set paxis 1 label "SOLO" offset 0
set paxis 2 label "OBJECTIVE" offset 0.5
set paxis 3 label "LIVE" offset 0.5
set paxis 4 label "PHYSICAL" offset 0.5
set paxis 5 label "TEAM" offset 0
set paxis 6 label "SUBJECTIVE" offset 0.5
set paxis 7 label "PRIZE" offset 0.75
set paxis 8 label "MENTAL" offset 0.5
%s
set colorbox vertical origin screen 0.9, 0.2 size screen 0.05, 0.6 front noinvert bdefault
array data = [ %s ]
set style spiderplot fs transparent solid 0.2 border lw 1 pt 13 ps 0.5
set style parallelaxis front lw 5
set grid spider lt black lc "grey" lw 0.75 back
plot for [i=1:|data|] data using (data[i]) lc '%s' lw 2
