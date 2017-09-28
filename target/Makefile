.PHONY: all staging

TOP := $(shell cd .. && pwd)
CWD := $(shell pwd)

BUILD := $(CWD)/build
TOOLS := $(TOP)/tools
STAGING := $(TOP)/staging
SOURCES := $(TOP)/sources
PATCHES := $(TOP)/patches

LC_ALL      := C
CCACHE_PATH := $(PATH)
LD_RUN_PATH := $(STAGING)/lib
LDFLAGS     := -L$(STAGING)/lib
PATH        := $(STAGING)/bin:$(TOOLS)/bin
CPPFLAGS    := -I$(STAGING)/include -DNDEBUG
PKG_CONFIG_PATH := $(STAGING)/lib/pkgconfig
export CCACHE_PATH CPPFLAGS LC_ALL LD_RUN_PATH LDFLAGS PATH PKG_CONFIG_PATH
unexport CFLAGS CXXFLAGS

CMAKE_INCLUDE_PATH := $(STAGING)/include
CMAKE_LIBRARY_PATH := $(STAGING)/lib
export CMAKE_INCLUDE_PATH CMAKE_LIBRARY_PATH

AUTORECONF := autoreconf
UNZIP := unzip -n -q
PATCH_RAW := patch
CHRPATH := chrpath
READELF := readelf
PATCH := patch -b
MKDIR := mkdir -p
FGREP := grep -F
CMAKE := cmake
CHMOD := chmod
STRIP := strip
TOUCH := touch
XARGS := xargs
FALSE := false
TRUE := true
FIND := find
ECHO := echo
SED := sed
CAT := cat
CP := cp -af
RM := rm -f
MV := mv -f
LN := ln -f
AR := ar

MACHINE := $(shell uname -m)
SYSTEM := $(shell uname -s)

LIBHUGETLBFS :=
LIBHUGETLBFS_FLAGS := LIB32=lib LIB64=lib64
ifeq ($(MACHINE),x86_64)
LIBHUGETLBFS_FLAGS := LIB32=lib32 LIB64=lib
endif
ifeq ($(SYSTEM),Linux)
LIBHUGETLBFS := ._libhugetlbfs
endif

OpenSSL_configure := ./config
SO_S := so*
SO := so
ifeq ($(SYSTEM),Darwin)
MACOSX := macosx/
SO_S := *dylib
SO := dylib
ifeq ($(MACHINE),x86_64)
OpenSSL_configure := ./Configure darwin64-x86_64-cc
endif
endif

comma := ,
define M
._$(1): $(SOURCES)/$(2) $(foreach D,$(3),._$(D))
	$(RM) -R $(BUILD)/$$(basename $$(basename $$(notdir $$<)))
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

all: staging
	cd $(STAGING) && for i in `$(FIND) bin lib libexec sbin -type f`; do ../fixpath.sh "$${i}" lib; done >chrpath.log 2>&1

staging: ._libintl ._mod_fcgid ._sqlite3 ._mysql++ ._clearsilver ._jsoncpp \
         ._libcurl ._logrotate ._gsoap ._fcgi ._libxslt ._php7 ._memcached \
         ._nginx ._libmemcached ._php7-memcached ._hiredis ._libmpc \
         ._libev ._tar ._googletest ._protobuf ._libarchive ._php7-apcu \
         ._php7-uuid ._thrift ._gperftools ._zookeeper ._mysql-connector-c++

$(SOURCES)/%:
	$(MAKE) -C $(SOURCES) $(notdir $@)

$(eval $(call M,xz,xz-5.2.3.tar.bz2))
$(eval $(call M,gzip,gzip-1.8.tar.gz))
$(eval $(call M,libev,libev-4.24.tar.gz))
$(eval $(call M,libpng,libpng-1.6.32.tar.xz))
$(eval $(call M,libtool,libtool-2.4.6.tar.xz))
$(eval $(call M,fcgi,libfcgi-2.4.0.orig.tar.gz))
$(eval $(call M,libmpfr,mpfr-3.1.5.tar.xz,libgmp))
$(eval $(call M,libgmp,gmp-6.1.2.tar.xz,libreadline))
$(eval $(call M,libmpc,mpc-1.0.3.tar.gz,libgmp libmpfr))
$(eval $(call M,sqlite3,sqlite-autoconf-3200100.tar.gz))
$(eval $(call M,libpopt,popt-1.16.tar.gz,,--disable-nls))
$(eval $(call M,c-ares,c-ares-1.12.0.tar.gz,,--disable-tests))
$(eval $(call M,libmcrypt,libmcrypt-2.5.8.tar.bz2,,--enable-static))
$(eval $(call M,libevent,libevent-2.1.8-stable.tar.gz,openssl zlib))
$(eval $(call M,libfreetype2,freetype-2.7.1.tar.bz2,bzip2 libpng zlib))
$(eval $(call M,libxslt,libxslt-1.1.30.tar.gz,libxml2,--without-python))
$(eval $(call M,libjpeg,jpeg-9b.tar.gz,,--enable-shared --enable-static))
$(eval $(call M,libreadline,readline-7.0.tar.gz,libncurses,--with-curses))
$(eval $(call M,apr,apr-1.6.2.tar.bz2,util-linux,--enable-threads --enable-posix-shm))
$(eval $(call M,libiconv,libiconv-1.15.tar.gz,,--enable-static --disable-rpath --disable-nls))
$(eval $(call M,libncurses,ncurses-6.0.tar.gz,,--without-debug --with-shared --enable-overwrite))
$(eval $(call M,util-linux,util-linux-2.21.2.tar.xz,,--without-ncurses --disable-nls,-C libuuid,-C libuuid))
$(eval $(call M,libxml2,libxml2-2.9.5.tar.gz,libreadline xz zlib,--without-python --with-zlib=$(STAGING) --with-lzma=$(STAGING)))
$(eval $(call M,tar,tar-1.29.tar.xz,bzip2 gzip xz,--disable-rpath --disable-acl --disable-nls --without-posix-acls --without-selinux --without-xattrs))
$(eval $(call M,pcre,pcre-8.40.tar.bz2,bzip2 libreadline zlib,--disable-cpp --enable-unicode-properties --enable-pcregrep-libz --enable-pcregrep-libbz2 --enable-pcretest-libreadline))
$(eval $(call M,nghttp2,nghttp2-1.26.0.tar.xz,libev libevent libxml2 openssl zlib,--disable-app --enable-asio-lib --disable-hpack-tools --disable-examples --disable-failmalloc --disable-python-bindings --without-boost --without-spdylay --without-jemalloc))
$(eval $(call M,apr-util,apr-util-1.6.0.tar.bz2,apr expat libiconv mysql openssl sqlite3 util-linux,--with-apr=$(STAGING) --with-expat=$(STAGING) --with-crypto --without-ldap --with-openssl=$(STAGING) --with-sqlite3=$(STAGING) --with-mysql=$(STAGING) --with-iconv=$(STAGING)))
$(eval $(call M,thrift,thrift-0.9.3.tar.gz,boost libevent openssl php7 zlib,PHP_PREFIX='$(STAGING)/lib/php' --disable-tests --disable-tutorial --without-php_extension --without-lua --without-qt4 --without-c_glib --without-csharp --without-java --without-erlang --without-python --without-perl --without-ruby --without-haskell --without-go --without-d))
$(eval $(call M,libcurl,curl-7.55.1.tar.xz,c-ares nghttp2 openssl zlib,--enable-http --enable-crypto-auth --enable-ipv6 --enable-tls-srp --enable-ftp --enable-manual --disable-ldap --disable-ldaps --disable-rtsp --enable-proxy --enable-dict --enable-telnet --enable-tftp --enable-pop3 --enable-imap --enable-smtp --enable-gopher --enable-file --without-krb4 --without-libidn --without-ca-bundle --without-ca-path --without-gssapi --disable-libcurl-option --enable-verbose --enable-shared --enable-static --enable-cookies --enable-symbol-hiding --disable-threaded-resolver --disable-curldebug --enable-optimize --disable-debug --without-librtmp --without-libssh2 --without-winidn --without-libmetalink --without-axtls --without-nss  --without-cyassl --disable-dependency-tracking --without-gnutls --without-darwinssl --without-winssl --disable-ntlm-wb --disable-sspi --enable-largefile --without-polarssl --enable-ares))
$(eval $(call M,php7,php-7.0.24.tar.xz,bzip2 icu libcurl libfreetype2 libgmp libiconv libjpeg libintl libmcrypt libpng libtool libxml2 sqlite3 zlib,--enable-fpm --enable-intl=shared --with-libxml-dir=$(STAGING) --with-openssl=shared$(comma)$(STAGING) --with-pdo-sqlite=shared$(comma)$(STAGING) --with-pdo-mysql=shared$(comma)mysqlnd --with-pcre-dir=$(STAGING) --with-pcre-regex=$(STAGING) --with-sqlite3=shared$(comma)$(STAGING) --with-mysqli=shared$(comma)mysqlnd --enable-mysqlnd=shared --with-curl=shared$(comma)$(STAGING) --with-xmlrpc=shared --enable-opcache --enable-mbstring --enable-sysvmsg --enable-sysvshm --enable-sysvsem --enable-sockets --enable-shmop --enable-pcntl --enable-bcmath --enable-calendar --enable-ftp=shared --enable-soap --with-config-file-path=/etc --with-mcrypt=shared$(comma)$(STAGING) --with-gettext=shared$(comma)$(STAGING) --with-icu-dir=$(STAGING) --with-gmp=shared$(comma)$(STAGING) --with-iconv=shared$(comma)$(STAGING) --with-iconv-dir=$(STAGING) --with-gd=shared --with-freetype-dir=$(STAGING) --with-jpeg-dir=$(STAGING) --with-png-dir=$(STAGING) --with-zlib-dir=$(STAGING) --with-zlib=$(STAGING) --with-bz2=shared$(comma)$(STAGING) --enable-wddx=shared))

# protobuf needs external gmock support, or not.
._protobuf: $(SOURCES)/protobuf-3.4.1.tar.gz ._zlib
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(PATCH) -p1 <'$(PATCHES)/protobuf.patch' && \
        $(AUTORECONF) -fvi && \
        ./configure --prefix=$(STAGING) --with-zip && \
        $(MAKE) && $(MAKE) install && \
        $(RM) -r $(STAGING)/lib/php/GPBMetadata $(STAGING)/lib/php/Google && \
        $(CP) php/src/GPBMetadata php/src/Google $(STAGING)/lib/php && \
	$(TOUCH) $@

# gperftools is evolving and not quite adapted to some environments.
._gperftools: $(SOURCES)/gperftools-2.5.tar.gz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(PATCH) -p1 <'$(PATCHES)/gperftools.patch' && \
        ./configure --prefix=$(STAGING) \
                    --disable-libunwind \
                    --enable-sized-delete && \
        $(MAKE) install-libLTLIBRARIES install-data
	$(TOUCH) $@

# ICU is hard to build.
._icu: $(SOURCES)/icu4c-58_2-src.tgz
	$(RM) -R $(BUILD)/icu
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/icu/source && \
        ./configure --prefix=$(STAGING) \
                    --enable-rpath \
                    --enable-static \
                    --disable-tests \
                    --disable-samples && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# expat uses cmake.
._expat: $(SOURCES)/libexpat-R_2_2_1.tar.gz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<)))/expat && \
        $(CMAKE) . -DCMAKE_INSTALL_PREFIX=$(STAGING) \
                   -DBUILD_tools=OFF \
                   -DBUILD_example=OFF \
                   -DBUILD_tests=OFF \
                   -DBUILD_shared=ON \
                   -DBUILD_doc=OFF && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# libarchive uses cmake.
._libarchive: $(SOURCES)/libarchive-3.3.2.tar.gz ._bzip2 ._gzip ._libxml2 ._xz ._openssl ._zlib
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(CMAKE) . -DCMAKE_INSTALL_PREFIX=$(STAGING) \
                   -DENABLE_ACL=OFF \
                   -DENABLE_TAR=OFF \
                   -DENABLE_CPIO=OFF \
                   -DENABLE_TEST=OFF \
                   -DENABLE_XATTR=OFF && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# MySQL uses cmake.
._mysql: $(SOURCES)/mysql-5.7.18.tar.gz ._boost ._libevent ._libncurses ._openssl
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(CMAKE) . -DCMAKE_INSTALL_PREFIX=$(STAGING) \
                   -DINSTALL_LAYOUT=RPM \
                   -DINSTALL_LIBDIR=lib \
                   -DINSTALL_PLUGINDIR=lib/mysql/plugin \
                   -DINSTALL_MYSQLDATADIR=var/mysql \
                   -DWITH_UNIT_TESTS=OFF \
                   -DWITHOUT_SERVER=ON \
                   -DWITH_BOOST=system \
                   -DWITH_LIBEVENT=system \
                   -DWITH_SSL=system \
                   -DWITH_ZLIB=system && \
        $(MAKE) && $(MAKE) install
	$(LN) -s libmysqlclient.a $(STAGING)/lib/libmysqlclient_r.a
	$(LN) -s libmysqlclient.$(SO) $(STAGING)/lib/libmysqlclient_r.$(SO)
	$(TOUCH) $@

# MySQL Connector/C++ uses cmake.
._mysql-connector-c++: $(SOURCES)/mysql-connector-c++-1.1.8.tar.gz ._boost ._mysql
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(CMAKE) . -DCMAKE_INSTALL_PREFIX=$(STAGING) \
                   -DCMAKE_INSTALL_LIBDIR=lib \
                   -DMYSQLCPPCONN_BUILD_EXAMPLES=OFF && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# zookeeper is a big package but I need only a small portion.
._zookeeper: $(SOURCES)/zookeeper-3.4.10.tar.gz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<)))/src/c && \
        $(PATCH) -p1 <'$(PATCHES)/zookeeper.patch' && \
        ./configure --prefix=$(STAGING) && $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# boost, headache.
._boost: $(SOURCES)/boost_1_59_0.tar.bz2 ._zlib ._bzip2 ._icu ._libiconv
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        if [ -f '$(PATCHES)/$(SYSTEM)/boost.patch' ]; then \
            $(PATCH) -p1 <'$(PATCHES)/$(SYSTEM)/boost.patch'; \
        elif [ -f '$(PATCHES)/boost.patch' ]; then \
            $(PATCH) -p1 <'$(PATCHES)/boost.patch'; \
        fi && \
        ./bootstrap.sh --prefix=$(STAGING) \
            --without-libraries=python,graph_parallel,mpi && \
        ./b2 include='$(STAGING)/include' linkflags='-L$(STAGING)/lib' \
            variant=release link=shared,static threading=multi install
	$(TOUCH) $@

# libintl and libiconv are two idiots.
._libintl: $(SOURCES)/gettext-0.19.8.1.tar.xz ._libiconv
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<)))/gettext-runtime && \
        ./configure --prefix=$(STAGING) --disable-rpath \
        --with-included-gettext && $(MAKE) -C intl && $(MAKE) -C intl install
	$(TOUCH) $@

# This one is definitely something.
._libhugetlbfs: $(SOURCES)/libhugetlbfs-2.20.tar.gz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(MAKE) BUILDTYPE=NATIVEONLY PREFIX=$(STAGING) $(LIBHUGETLBFS_FLAGS) libs tools install
	$(TOUCH) $@

# memcached needs to be reconfigured.
._memcached: $(SOURCES)/memcached-1.4.37.tar.gz ._libevent $(LIBHUGETLBFS)
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(PATCH) -p1 <$(PATCHES)/memcached.patch && \
        $(AUTORECONF) -fvi && \
        ./configure --prefix=$(STAGING) --bindir=$(STAGING)/sbin && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# zlib needs a libtool archive.
._zlib: $(SOURCES)/zlib-1.2.11.tar.xz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        ./configure --prefix=$(STAGING) && $(MAKE) && $(MAKE) install
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libz.la.in >$(STAGING)/lib/libz.la
	$(TOUCH) $@

# googletest uses cmake.
._googletest: $(SOURCES)/googletest-release-1.8.0.tar.gz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(CMAKE) . -DCMAKE_INSTALL_PREFIX=$(STAGING) && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# bzip2 doesn't use GNU autotools.
._bzip2: $(SOURCES)/bzip2-1.0.6.tar.gz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xzf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(PATCH_RAW) -p1 <$(PATCHES)/bzip2-target.patch && \
        $(AUTORECONF) -fvi && \
        ./configure --prefix=$(STAGING) && $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# MySQL++ needs to be patched to produce static libraries.
._mysql++: $(SOURCES)/mysql++-3.2.3.tar.gz ._mysql ._libintl
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(PATCH) -p1 <$(PATCHES)/mysql++.patch && \
        PTHREAD_CFLAGS="-pthread" PTHREAD_LIBS="-pthread" \
        ./configure --prefix=$(STAGING) --enable-static --enable-thread-check \
        --with-mysql=$(STAGING) && $(MAKE) && $(MAKE) install
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libmysqlpp.la.in >$(STAGING)/lib/libmysqlpp.la
	$(TOUCH) $@

# ClearSilver needs to be patched on 64 bit platforms.
._clearsilver: $(SOURCES)/clearsilver-0.10.5.tar.gz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(PATCH) -p1 <$(PATCHES)/clearsilver.patch && \
        ./configure --disable-apache --disable-python --disable-perl --disable-ruby   \
        --disable-java --disable-csharp --prefix=$(STAGING) && \
        $(MAKE) && $(MAKE) install && $(MAKE) -C dso && \
        $(CP) dso/libneo.$(SO_S) $(STAGING)/lib && \
        $(RM) -R tmp && $(MKDIR) tmp && cd tmp && \
        $(AR) x ../libs/libneo_cgi.a && \
        $(AR) x ../libs/libneo_cs.a && \
        $(AR) x ../libs/libneo_utl.a && \
        $(AR) rcs $(STAGING)/lib/libneo.a *.o
	$(LN) -s libneo.$(SO) $(STAGING)/lib/libneo_cs.$(SO)
	$(LN) -s libneo.$(SO) $(STAGING)/lib/libneo_cgi.$(SO)
	$(LN) -s libneo.$(SO) $(STAGING)/lib/libneo_utl.$(SO)
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libneo_cgi.la.in >$(STAGING)/lib/libneo_cgi.la
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libneo_cs.la.in >$(STAGING)/lib/libneo_cs.la
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libneo_utl.la.in >$(STAGING)/lib/libneo_utl.la
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libneo.la.in >$(STAGING)/lib/libneo.la
	$(TOUCH) $@

# gSOAP is distributed with zipball.
._gsoap: $(SOURCES)/gsoap_2.8.51.zip ._openssl
	$(RM) -R $(BUILD)/gsoap-2.8
	$(MKDIR) $(BUILD) && cd $(BUILD) && $(UNZIP) $<
	cd $(BUILD)/gsoap-2.8 && \
        $(PATCH) -p1 <$(PATCHES)/gsoap.patch && \
        $(AUTORECONF) -fvi && \
        ./configure --prefix=$(STAGING) --enable-ipv6 --with-openssl=$(STAGING) && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# HTTPd needs a little tweak.
._httpd: $(SOURCES)/httpd-2.4.27.tar.bz2 ._apr ._apr-util ._pcre ._openssl ._libxml2 ._nghttp2
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) &&                               \
        $(CP) $(CWD)/config.layout . && ./configure --prefix=$(STAGING)               \
        --enable-mods-shared=all --enable-mpms-shared=all --enable-cgi                \
        --disable-unique-id --disable-authnz-ldap --disable-ldap --disable-lua        \
        --with-apr=$(STAGING) --with-apr-util=$(STAGING) --with-pcre=$(STAGING)       \
        --with-z=$(STAGING) --with-libxml2=$(STAGING)/include/libxml2                 \
        --enable-access-compat=static --enable-alias=static                           \
        --enable-auth-basic=static --enable-authn-core=static                         \
        --enable-authn-file=static --enable-authz-core=static                         \
        --enable-authz-groupfile=static --enable-authz-host=static                    \
        --enable-authz-user=static --enable-autoindex=static --enable-dir=static      \
        --enable-env=static --enable-filter=static --enable-headers=static            \
        --enable-log-config=static --enable-mime=static --enable-reqtimeout=static    \
        --enable-setenvif=static --enable-ssl=static --enable-status=static           \
        --enable-unixd=static --enable-version=static &&                              \
        $(SED) -i -e 's/HTTPD_ROOT .*/HTTPD_ROOT \"\/usr\"/'                          \
        include/ap_config_auto.h && $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# OpenSSL has something really weird.
._openssl: $(SOURCES)/openssl-1.0.2l.tar.gz ._zlib
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(PATCH) -p1 <$(PATCHES)/openssl.patch && \
        $(OpenSSL_configure) zlib threads shared no-krb5 no-ssl2 no-ssl3 \
        --prefix=$(STAGING) --openssldir=$(STAGING)/etc/ssl \
        --with-zlib-include=$(STAGING)/include --with-zlib-lib=$(STAGING)/lib && \
        CPPFLAGS="${CPPFLAGS} -DPURIFY" $(MAKE) && $(MAKE) install_sw
	$(CHMOD) +w $(STAGING)/lib/libcrypto.$(SO_S)
	$(CHMOD) +w $(STAGING)/lib/libssl.$(SO_S)
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libcrypto.la.in >$(STAGING)/lib/libcrypto.la
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libssl.la.in >$(STAGING)/lib/libssl.la
	$(TOUCH) $@

# jsoncpp uses cmake.
._jsoncpp: $(SOURCES)/jsoncpp-0.10.6.tar.gz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(PATCH) -p1 <$(PATCHES)/jsoncpp.patch && \
        $(CMAKE) . -DCMAKE_INSTALL_PREFIX=$(STAGING) \
                   -DINCLUDE_INSTALL_DIR=$(STAGING)/include \
                   -DBUILD_SHARED_LIBS=ON \
                   -DJSONCPP_WITH_TESTS=OFF \
                   -DJSONCPP_WITH_PKGCONFIG_SUPPORT=ON \
                   -DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF && \
        $(MAKE) && $(MAKE) install
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libjsoncpp.la.in >$(STAGING)/lib/libjsoncpp.la
	$(TOUCH) $@

# logrotate is also a geek.
._logrotate: $(SOURCES)/logrotate-3.12.2.tar.xz ._libpopt
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        ./autogen.sh && ./configure --prefix=$(STAGING) && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# mod_fcgid, kinda standard but is a geek here.
._mod_fcgid: $(SOURCES)/mod_fcgid-2.3.9.tar.bz2 ._httpd
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        ./configure.apxs && $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# Nginx is naughty about dependencies.
._nginx: $(SOURCES)/nginx-1.12.1.tar.gz ._openssl ._pcre
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	$(MKDIR) $(STAGING)/sbin
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
         ./configure --prefix=$(STAGING) --user=daemon --group=daemon --sbin-path=sbin \
                     --conf-path=etc/nginx/nginx.conf --error-log-path=log/nginx/error_log \
                     --http-log-path=log/nginx/access_log --pid-path=run/nginx.pid \
                     --http-client-body-temp-path=tmp/ngx_client \
                     --http-fastcgi-temp-path=tmp/ngx_fastcgi \
                     --http-proxy-temp-path=tmp/ngx_proxy \
                     --http-uwsgi-temp-path=tmp/ngx_uwsgi \
                     --http-scgi-temp-path=tmp/ngx_scgi \
                     --with-cc-opt="-I$(STAGING)/include" \
                     --with-ld-opt="-L$(STAGING)/lib" \
                     --with-pcre \
                     --with-ipv6 \
                     --with-threads \
                     --with-http_v2_module \
                     --with-http_ssl_module \
                     --with-http_realip_module \
                     --with-http_addition_module \
                     --with-http_sub_module \
                     --with-http_dav_module \
                     --with-http_flv_module \
                     --with-http_mp4_module \
                     --with-http_gunzip_module \
                     --with-http_gzip_static_module \
                     --with-http_auth_request_module \
                     --with-http_random_index_module \
                     --with-http_secure_link_module \
                     --with-http_degradation_module \
                     --with-http_stub_status_module \
                     --lock-path=run/nginx.lock && \
         $(SED) -i -e 's|NGX_PREFIX .*|NGX_PREFIX "/usr/"|g' \
               $(BUILD)/$(basename $(basename $(notdir $<)))/objs/ngx_auto_config.h && \
         $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# libmemcached requires a unnecessary TR1 header.
._libmemcached: $(SOURCES)/libmemcached-1.0.18.tar.gz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(PATCH) -p1 <$(PATCHES)/libmemcached.patch && \
        CXXFLAGS='-D__STDC_CONSTANT_MACROS $(CXXFLAGS)' \
            ./configure --prefix=$(STAGING) --disable-sasl && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# It's a PHP module.
._php7-apcu: $(SOURCES)/apcu-5.1.8.tgz ._php7
	$(RM) -R $(BUILD)/$(basename $(notdir $<))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(notdir $<)) && \
        $(STAGING)/bin/phpize && \
        ./configure --prefix=$(STAGING) && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# It's a PHP module.
._php7-memcached: $(SOURCES)/memcached-3.0.3.tgz ._php7 ._libmemcached ._zlib
	$(RM) -R $(BUILD)/$(basename $(notdir $<))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(notdir $<)) && \
        $(STAGING)/bin/phpize && \
        ./configure --prefix=$(STAGING) --with-libmemcached-dir=$(STAGING) \
                    --with-zlib-dir=$(STAGING) --disable-memcached-sasl && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# It's a PHP module.
._php7-uuid: $(SOURCES)/uuid-1.0.4.tgz ._php7 ._util-linux
	$(RM) -R $(BUILD)/$(basename $(notdir $<))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(notdir $<)) && \
        $(STAGING)/bin/phpize && \
        ./configure --prefix=$(STAGING) --with-uuid=$(STAGING) && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# xlslib, a little geeky.
._xlslib: $(SOURCES)/xlslib-package-2.5.0.zip ._libiconv
	$(RM) -R $(BUILD)/xlslib
	$(MKDIR) $(BUILD) && cd $(BUILD) && $(UNZIP) $<
	cd $(BUILD)/xlslib/xlslib && \
        $(PATCH) -p1 <$(PATCHES)/xlslib.patch && \
        $(AUTORECONF) -fvi && \
        ./configure --prefix=$(STAGING) && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# libxls, a little more geeky.
._libxls: $(SOURCES)/libxls-1.4.0.zip ._libiconv
	$(RM) -R $(BUILD)/libxls
	$(MKDIR) $(BUILD) && cd $(BUILD) && $(UNZIP) $<
	cd $(BUILD)/libxls && \
        ./configure --prefix=$(STAGING) && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# Hiredis, too simple, sometimes naive.
._hiredis: $(SOURCES)/hiredis-0.13.3.tar.gz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(MAKE) && $(MAKE) PREFIX=$(STAGING) install
	$(TOUCH) $@
