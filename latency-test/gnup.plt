reset

outfile='udp-tcp-latency'

set title "UDP vs TCP round trip times"
set yrange [50:120]
set xrange [0:1100]
set xlabel "Chunk size [B]"
set ylabel 'Latency [$\mu s$]'
plot './udp-latency.dat' using 1:2 title "UDP", './tcp-latency.dat' using 1:2 title "TCP", './tcp-latency-nodelay.dat' using 1:2 title "TCP nodelay"


set term push
set term epslatex standalone color solid 8 
#set term epslatex color  dashed size 5*1.2,3*1.1
set out sprintf('%s.tex',outfile)

plot './udp-latency.dat' using 1:2 title "UDP", './tcp-latency.dat' using 1:2 title "TCP", './tcp-latency-nodelay.dat' using 1:2 title "TCP nodelay"


unset out
system sprintf('latex "%s.tex"',outfile)
system sprintf('dvips -o "%s.ps" "%s.dvi"',outfile,outfile)
system sprintf('ps2pdf -dAutoRotatePages "%s.ps"',outfile)
system sprintf('rm %s.log',outfile)
system sprintf('rm %s.aux',outfile)
system sprintf('rm %s.ps',outfile)
system sprintf('rm %s.dvi',outfile)
system sprintf('rm %s.tex',outfile)
system sprintf('rm %s-inc.eps',outfile)
