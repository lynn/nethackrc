GENERATED_PARTS := parts/C-autopickup.6.g
RCS := nethack-343.rc nethack-343nao.rc nethack-362.rc

.PHONY: all clean
all: $(GENERATED_PARTS) $(RCS)
clean:
	rm -f $(GENERATED_PARTS) $(RCS)

parts/C-autopickup.6.g:
	sed 's/\*/.*/g' parts/C-autopickup.45 > $@

nethack-343.rc: $(PARTS)
	cat parts/*4* > $@

nethack-343nao.rc: $(PARTS)
	cat parts/*5* > $@

nethack-362.rc: $(PARTS)
	cat parts/*6* > $@

