# vim:set ts=8 sts=8 sw=8 tw=0:
#
# Last Change: 01-Dec-2003.
# Maintainer:  MURAOKA Taro <koron@tka.att.ne.jp>

NAME = ambsearch
DATA = default.vim\
       greek.vim\
       hankana.vim\
       jyouyou.vim\
       katakana.vim\
       kyouiku.vim\
       math.vim
DICTDIR = ambsearch
DATADIR = data
DISTFILES = $(DATADIR) \
	    $(DICTDIR) \
	    Makefile \
	    ambsearch.vim \
	    key_exchange.pl

DATE = $(shell date +%Y%m%d)
DATAFILES = $(addprefix $(DICTDIR)/, $(DATA))
NAME_DATE = $(NAME)-$(DATE)

default: $(DICTDIR) $(DATAFILES)

archive: tarbz2

tarbz2: $(NAME_DATE).tar.bz2

$(NAME_DATE).tar.bz2: $(NAME_DATE)
	tar cf $(NAME_DATE).tar $(NAME_DATE)
	bzip2 -f $(NAME_DATE).tar
	rm -rf $(NAME_DATE)

$(NAME_DATE): $(DICTDIR)
	mkdir $(NAME_DATE)
	cp -Rp $(DISTFILES) $(NAME_DATE)

$(DICTDIR)/*.vim: key_exchange.pl

$(DICTDIR)/%.vim: $(DATADIR)/%.txt
	perl key_exchange.pl $< > $@

$(DICTDIR):
	mkdir $(DICTDIR)

clean:
	rm -rf $(DICTDIR)

