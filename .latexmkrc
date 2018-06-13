# make diplom.tex the main tex file
@default_files = ('diplom.tex');

# lualatex (with --shell-escape for epstopdf package)
$pdflatex = 'lualatex --shell-escape %O %S';
$pdf_mode = 1;
$postscript_mode = $dvi_mode = 0;

# force latexmk to compile glossaries using the makeglossaries script
add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
sub makeglossaries {
    my ($base_name, $path) = fileparse( $_[0] );
    pushd $path;
    my $return = system "makeglossaries $base_name";
    popd;
    return $return;
}
