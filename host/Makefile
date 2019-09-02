.PHONY: all mrproper

TOP := $(shell cd .. && pwd)
CWD := $(shell pwd)

BUILD := $(CWD)/build
TOOLS := $(TOP)/tools
SOURCES := $(TOP)/sources
PATCHES := $(TOP)/patches

LC_ALL      := C
CCACHE_PATH := $(PATH)
PATH        := $(TOOLS)/bin
LDFLAGS     := -L$(TOOLS)/lib
CPPFLAGS    := -I$(TOOLS)/include -DNDEBUG
PKG_CONFIG_PATH := $(TOOLS)/lib/pkgconfig
export CCACHE_PATH CPPFLAGS LC_ALL LDFLAGS PATH PKG_CONFIG_PATH
unexport CFLAGS CXXFLAGS

PATCH := patch -b
MKDIR := mkdir -p
TOUCH := touch
CMAKE := cmake
CP := cp -af
RM := rm -f
LN := ln -f

SYSTEM := $(shell uname -s)

all: mrproper \
     ._tar ._coreutils ._grep ._sed ._gawk ._diff ._which ._make ._patch \
     ._find ._unzip ._pkg-config ._bison ._util-linux \
     ._flex ._libtool ._cmake

ifneq ($(SYSTEM),Darwin)
all: ._chrpath
endif

mrproper:
	@PATH="$(CCACHE_PATH)" $(CWD)/prepare.sh

$(SOURCES)/%:
	$(MAKE) -C $(SOURCES) $(notdir $@)

._tar: $(SOURCES)/tar-1.32.tar.xz ._gzip ._bzip2 ._xz
	$(RM) -r $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && xz -d -c $< | tar -x
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && ./configure --prefix=$(TOOLS) --disable-acl --disable-nls --without-posix-acls --without-selinux --without-xattrs && $(MAKE) && $(MAKE) install
	$(TOUCH) $@

._gzip: $(SOURCES)/gzip-1.10.tar.gz
	$(RM) -r $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && gzip -d -c $< | tar -x
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && ./configure --prefix=$(TOOLS) && $(MAKE) && $(MAKE) install-exec
	$(TOUCH) $@

._bzip2: $(SOURCES)/bzip2-1.0.8.tar.gz
	$(RM) -r $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && gzip -d -c $< | tar -x
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && $(MAKE) && $(MAKE) PREFIX=$(TOOLS) install
	$(TOUCH) $@

._xz: $(SOURCES)/xz-5.2.4.tar.bz2 ._bzip2
	$(RM) -r $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && bzip2 -d -c $< | tar -x
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && ./configure --prefix=$(TOOLS) --disable-shared --disable-nls && $(MAKE) && $(MAKE) install
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
		./configure --prefix=$$(TOOLS) $(4) && $$(MAKE) $(5) && $$(MAKE) $(6) install
	$(7)
	$(TOUCH) $$@
endef

$(eval $(call M,m4,m4-1.4.18.tar.xz))
$(eval $(call M,chrpath,chrpath-0.16.tar.gz))
$(eval $(call M,autoconf,autoconf-2.69.tar.xz,m4))
$(eval $(call M,grep,grep-3.3.tar.xz,,--disable-nls))
$(eval $(call M,make,make-4.2.1.tar.bz2,,--disable-nls))
$(eval $(call M,automake,automake-1.16.1.tar.xz,autoconf))
$(eval $(call M,diff,diffutils-3.7.tar.xz,,--disable-nls))
$(eval $(call M,which,which-2.21.tar.gz,,--disable-iberty))
$(eval $(call M,patch,patch-2.7.6.tar.xz,,--disable-xattr))
$(eval $(call M,bison,bison-3.4.1.tar.xz,m4,--disable-nls))
$(eval $(call M,cmake,cmake-3.9.6.tar.gz,,-- -DBUILD_CursesDialog=OFF))
$(eval $(call M,gawk,gawk-5.0.1.tar.xz,,,,,$(LN) -s gawk $(TOOLS)/bin/awk))
$(eval $(call M,libtool,libtool-2.4.6.tar.xz,automake,--disable-ltdl-install))
$(eval $(call M,find,findutils-4.7.0.tar.xz,,--disable-nls --without-selinux))
$(eval $(call M,sed,sed-4.7.tar.xz,,--disable-acl --disable-nls --without-selinux))
$(eval $(call M,pkg-config,pkg-config-0.29.2.tar.gz,,--disable-host-tool --with-internal-glib))
$(eval $(call M,flex,flex-2.6.4.tar.gz,libtool,--disable-shared --disable-nls,,,$(LN) -s flex $(TOOLS)/bin/lex))
$(eval $(call M,util-linux,util-linux-2.34.tar.xz,,--disable-all-programs --enable-getopt --without-ncurses --disable-nls))
$(eval $(call M,coreutils,coreutils-8.31.tar.xz,,--disable-acl --disable-libcap --disable-nls --disable-xattr --without-gmp --without-selinux))

._unzip: $(SOURCES)/unzip60.tar.gz
	$(RM) -r $(BUILD)/unzip60
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/unzip60 && $(LN) unix/Makefile . && $(MAKE) generic && $(MAKE) prefix=$(TOOLS) install
	$(TOUCH) $@
