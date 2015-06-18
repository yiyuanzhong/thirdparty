.PHONY: all clean

TOP = $(shell cd .. && pwd)
CWD = $(shell pwd)

BUILD = $(CWD)/build
STAGING = $(TOP)/tools
SOURCES = $(TOP)/sources
PATCHES = $(TOP)/patches

LC_ALL   = C
CFLAGS   = -g -O2
CXXFLAGS = -g -O2
CPPFLAGS = -I$(STAGING)/include -DNDEBUG
LDFLAGS  = -L$(STAGING)/lib
PATH := $(STAGING)/bin:$(PATH)
PKG_CONFIG_PATH = $(STAGING)/lib/pkgconfig
export CFLAGS CPPFLAGS CXXFLAGS LC_ALL LDFLAGS PATH PKG_CONFIG_PATH

PATCH=patch -b
MKDIR=mkdir -p
TOUCH=touch
CP=cp -af
RM=rm -f
LN=ln -f

SYSTEM := $(shell uname -s)

all: ._tar ._coreutils ._patch ._find ._sed ._unzip ._make ._pkg-config ._bison ._flex ._libtool ._cmake ._chrpath

clean:
	$(RM) ._*
	$(RM) -r $(BUILD)

._tar: $(SOURCES)/tar-1.27.1.tar.xz ._gzip ._bzip2 ._xz
	$(RM) -r $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && xz -d -c $< | tar -x
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && ./configure --prefix=$(STAGING) --disable-acl --disable-nls --without-posix-acls --without-selinux --without-xattrs && $(MAKE) && $(MAKE) install
	$(TOUCH) $@

._gzip: $(SOURCES)/gzip-1.6.tar.gz
	$(RM) -r $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && gzip -d -c $< | tar -x
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && ./configure --prefix=$(STAGING) && $(MAKE) && $(MAKE) install-exec
	$(TOUCH) $@

._bzip2: $(SOURCES)/bzip2-1.0.6.tar.gz
	$(RM) -r $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && gzip -d -c $< | tar -x
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && $(PATCH) -p1 <$(PATCHES)/bzip2-host.patch && $(MAKE) && $(MAKE) PREFIX=$(STAGING) install
	$(TOUCH) $@

._xz: $(SOURCES)/xz-5.2.1.tar.bz2 ._bzip2
	$(RM) -r $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && bzip2 -d -c $< | tar -x
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && ./configure --prefix=$(STAGING) --disable-shared --disable-nls && $(MAKE) && $(MAKE) install
	$(TOUCH) $@

define M
._$(1): $(SOURCES)/$(2) $(foreach D,$(3),._$(D))
	$(RM) -r $(BUILD)/$$(basename $$(basename $$(notdir $$<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $$<
	cd $(BUILD)/$$(basename $$(basename $$(notdir $$<))) && \
		if [ -f '$(PATCHES)/$(SYSTEM)/$(1).patch' ]; then \
			$(PATCH) -p1 <'$(PATCHES)/$(SYSTEM)/$(1).patch'; \
		elif [ -f '$(PATCHES)/$(1).patch' ]; then \
			$(PATCH) -p1 <'$(PATCHES)/$(1).patch'; \
		fi && \
		./configure --prefix=$$(STAGING) $(4) && $$(MAKE) $(5) && $$(MAKE) $(6) install
	$(7)
	$(TOUCH) $$@
endef

$(eval $(call M,m4,m4-1.4.17.tar.xz))
$(eval $(call M,cmake,cmake-3.2.3.tar.gz))
$(eval $(call M,autoconf,autoconf-2.69.tar.xz,m4))
$(eval $(call M,make,make-4.1.tar.bz2,,--disable-nls))
$(eval $(call M,automake,automake-1.15.tar.xz,autoconf))
$(eval $(call M,patch,patch-2.7.5.tar.xz,,--disable-xattr))
$(eval $(call M,bison,bison-3.0.4.tar.xz,m4,--disable-nls))
$(eval $(call M,libtool,libtool-2.4.6.tar.xz,automake,--disable-ltdl-install))
$(eval $(call M,find,findutils-4.5.14.tar.gz,,--disable-nls --without-selinux))
$(eval $(call M,sed,sed-4.2.2.tar.bz2,,--disable-acl --disable-nls --without-selinux))
$(eval $(call M,pkg-config,pkg-config-0.28.tar.gz,,--disable-host-tool --with-internal-glib))
$(eval $(call M,flex,flex-2.5.39.tar.xz,,--disable-shared --disable-nls,,,$(LN) -s flex $(STAGING)/bin/lex))
$(eval $(call M,coreutils,coreutils-8.23.tar.xz,,--disable-acl --disable-libcap --disable-nls --disable-xattr --without-gmp --without-selinux))

ifeq ($(SYSTEM),Darwin)
._chrpath: bin/chrpath
	$(MKDIR) $(STAGING)/bin
	$(CP) bin/chrpath $(STAGING)/bin
	$(TOUCH) $@
else
._chrpath: $(SOURCES)/chrpath-0.16.tar.gz
	$(RM) -r $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
		./configure --prefix=$(STAGING) && $(MAKE) && $(MAKE) install
	$(TOUCH) $@
endif

._unzip: $(SOURCES)/unzip60.tar.gz
	$(RM) -r $(BUILD)/unzip60
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/unzip60 && $(LN) unix/Makefile . && $(MAKE) generic && $(MAKE) prefix=$(STAGING) install
	$(TOUCH) $@
