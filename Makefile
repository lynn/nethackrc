GEN4 :=
GEN5 :=
GEN6 := parts/C-autopickup.6.g parts/E-msgtype.6.g
GENERATED_PARTS := $(GEN4) $(GEN5) $(GEN6)
RCS := nethack-343.rc nethack-343nao.rc nethack-362.rc

.PHONY: all clean
all: $(GENERATED_PARTS) $(RCS)
clean:
	rm -f $(GENERATED_PARTS) $(RCS)

# NetHack 3.6.2 uses regex for autopickup exceptions and MSGTYPE.
# Our 3.4.3-nao files use glob syntax (? and *).
# We generate the 3.6.2 files from the 3.4.3-nao files:
parts/C-autopickup.6.g: parts/C-autopickup.5
	sed '2,$$s/\./\\./g;s/\*/.*/g' $< > $@

parts/E-msgtype.6.g: parts/E-msgtype.5
	sed '2,$$s/\./\\./g;s/\*/.*/g' $< > $@

# The digits in the part filenames say how to assemble the .rcs:
nethack-343.rc: parts/*4* $(GEN4)
	cat $^ > $@

nethack-343nao.rc: parts/*5* $(GEN5)
	cat $^ > $@

nethack-362.rc: parts/*6* $(GEN6)
	cat $^ > $@

