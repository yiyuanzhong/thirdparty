.PHONY: all clean host scmclean sources target

TOP = $(shell cd .. && pwd)
CWD = $(shell pwd)

STAGING = $(CWD)/staging
OUTPUT = $(CWD)/output
TOOLS = $(CWD)/tools

CP = cp -pd
RM = rm -f

all: sources host target scmclean

host:
	$(MAKE) -C host

target:
	$(MAKE) -C target

sources:
	$(MAKE) -C sources

scmclean:
	@if [ -n "$${SCMBUILD}" ]; then \
        $(MAKE) -C target clean; \
        $(MAKE) -C host clean; \
    fi

clean:
	$(MAKE) -C target clean
	$(MAKE) -C host clean
	$(RM) -r $(STAGING)
	$(RM) -r $(OUTPUT)
	$(RM) -r $(TOOLS)
