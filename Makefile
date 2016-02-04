.PHONY: all clean debug host release shrink target

TOP = $(shell cd .. && pwd)
CWD = $(shell pwd)

STAGING = $(CWD)/staging
OUTPUT = $(CWD)/output
TOOLS = $(CWD)/tools

CP = cp -pd
RM = rm -f

all: release
debug: host target
release: debug shrink

host:
	$(MAKE) -C host

target:
	$(MAKE) -C target

shrink:
	$(RM) -r target/build host/build
	$(RM) target/._* host/._*

clean: shrink
	$(RM) -r $(STAGING)
	$(RM) -r $(OUTPUT)
	$(RM) -r $(TOOLS)
