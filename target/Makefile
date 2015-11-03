.PHONY: all clean staging

TOP := $(shell cd .. && pwd)
CWD := $(shell pwd)

BUILD := $(CWD)/build
TOOLS := $(TOP)/tools
STAGING := $(TOP)/staging
SOURCES := $(TOP)/sources
PATCHES := $(TOP)/patches

LC_ALL   := C
CFLAGS   := -g -O2
CXXFLAGS := -g -O2
LDFLAGS  := -L$(STAGING)/lib
LD_RUN_PATH := $(STAGING)/lib
CPPFLAGS := -I$(STAGING)/include -DNDEBUG
PKG_CONFIG_PATH := $(STAGING)/lib/pkgconfig
PATH := $(STAGING)/sbin:$(STAGING)/bin:$(TOOLS)/bin:$(PATH)
export CFLAGS CPPFLAGS CXXFLAGS LC_ALL LD_RUN_PATH LDFLAGS PATH PKG_CONFIG_PATH

CMAKE_INCLUDE_PATH := $(STAGING)/include
CMAKE_LIBRARY_PATH := $(STAGING)/lib
export CMAKE_INCLUDE_PATH CMAKE_LIBRARY_PATH

AUTORECONF := autoreconf
PATCH_RAW := patch
CHRPATH := chrpath
READELF := readelf
PATCH := patch -b
MKDIR := mkdir -p
UNZIP := unzip -q
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

boost_version := 1_59_0
thrift_version := 0.9.3
thrift_flags := --disable-tests --disable-tutorial
ifneq ($(shell ../version.sh $(CXX) 4.3.0),OK)
ifneq ($(SYSTEM),Darwin)
boost_version := 1_55_0
thrift_version := 0.9.1
thrift_flags := --without-tests
endif
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
         ._libcurl ._logrotate ._gsoap ._fcgi ._libxslt ._php5 ._memcached \
         ._tinyxml ._nginx ._libmemcached ._php5-memcached ._hiredis \
         ._libev ._xlslib ._libxls ._tar ._gmock ._protobuf ._libarchive \
         ._php5-uuid ._thrift ._gperftools ._zookeeper ._mysql-connector-c++

clean:
	rm -f ._*
	$(RM) -R $(BUILD)

$(eval $(call M,xz,xz-5.2.1.tar.bz2))
$(eval $(call M,gzip,gzip-1.6.tar.gz))
$(eval $(call M,fcgi,fcgi-2.4.0.tar.gz))
$(eval $(call M,libev,libev-4.20.tar.gz))
$(eval $(call M,c-ares,c-ares-1.10.0.tar.gz))
$(eval $(call M,libpng,libpng-1.6.18.tar.xz))
$(eval $(call M,libtool,libtool-2.4.6.tar.xz))
$(eval $(call M,protobuf,protobuf-2.6.1.tar.bz2,zlib))
$(eval $(call M,sqlite3,sqlite-autoconf-3090100.tar.gz))
$(eval $(call M,libpopt,popt-1.16.tar.gz,,--disable-nls))
$(eval $(call M,gperftools,gperftools-2.4.tar.gz,,--enable-minimal))
$(eval $(call M,libmcrypt,libmcrypt-2.5.8.tar.bz2,,--enable-static))
$(eval $(call M,libevent,libevent-2.0.22-stable.tar.gz,openssl zlib))
$(eval $(call M,libfreetype2,freetype-2.5.5.tar.bz2,bzip2 libpng zlib))
$(eval $(call M,libxslt,libxslt-1.1.28.tar.gz,libxml2,--without-python))
$(eval $(call M,libreadline,readline-6.3.tar.gz,libncurses,--with-curses))
$(eval $(call M,apr,apr-1.5.2.tar.bz2,util-linux,--enable-threads --enable-posix-shm))
$(eval $(call M,libiconv,libiconv-1.14.tar.gz,,--enable-static --disable-rpath --disable-nls))
$(eval $(call M,libncurses,ncurses-5.9.tar.gz,,--without-debug --with-shared --enable-overwrite))
$(eval $(call M,flex,flex-2.5.39.tar.xz,,--disable-shared --disable-nls,,,$(LN) -s flex $(STAGING)/bin/lex))
$(eval $(call M,util-linux,util-linux-2.21.2.tar.xz,,--without-ncurses --disable-nls,-C libuuid,-C libuuid))
$(eval $(call M,libxml2,libxml2-2.9.2.tar.gz,libreadline xz zlib,--without-python --with-zlib=$(STAGING) --with-lzma=$(STAGING)))
$(eval $(call M,tar,tar-1.27.1.tar.xz,bzip2 gzip xz,--disable-rpath --disable-acl --disable-nls --without-posix-acls --without-selinux --without-xattrs))
$(eval $(call M,pcre,pcre-8.37.tar.bz2,bzip2 libreadline zlib,--disable-cpp --enable-unicode-properties --enable-pcregrep-libz --enable-pcregrep-libbz2 --enable-pcretest-libreadline))
$(eval $(call M,nghttp2,nghttp2-1.3.4.tar.xz,libev libevent libxml2 openssl zlib,--disable-app --enable-asio-lib --disable-hpack-tools --disable-examples --disable-failmalloc --disable-python-bindings --without-boost --without-spdylay --without-jemalloc))
$(eval $(call M,apr-util,apr-util-1.5.4.tar.bz2,apr libiconv mysql openssl sqlite3 util-linux,--with-apr=$(STAGING) --with-expat=builtin --with-crypto --without-ldap --with-openssl=$(STAGING) --with-sqlite3=$(STAGING) --with-mysql=$(STAGING) --with-iconv=$(STAGING)))
$(eval $(call M,thrift,thrift-$(thrift_version).tar.gz,boost libevent openssl php5 zlib,PHP_PREFIX='$(STAGING)/lib/php' $(thrift_flags) --without-php_extension --without-lua --without-qt4 --without-c_glib --without-csharp --without-java --without-erlang --without-python --without-perl --without-ruby --without-haskell --without-go --without-d))
$(eval $(call M,php5,php-5.6.14.tar.xz,bzip2 icu libcurl libfreetype2 libiconv libjpeg libintl libmcrypt libpng libtool libxml2 sqlite3 zlib,--enable-fpm --enable-intl=shared --with-libxml-dir=$(STAGING) --with-openssl=shared$(comma)$(STAGING) --with-pdo-sqlite=shared$(comma)$(STAGING) --with-pdo-mysql=shared$(comma)mysqlnd --with-pcre-dir=$(STAGING) --with-pcre-regex=$(STAGING) --with-sqlite3=shared$(comma)$(STAGING) --with-mysql=shared$(comma)mysqlnd --with-mysqli=shared$(comma)mysqlnd --enable-mysqlnd=shared --with-curl=shared$(comma)$(STAGING) --with-xmlrpc=shared --enable-opcache --enable-mbstring --enable-sysvmsg --enable-sysvshm --enable-sysvsem --enable-sockets --enable-shmop --enable-pcntl --enable-bcmath --enable-calendar --enable-ftp=shared --enable-soap --with-config-file-path=/etc --with-mcrypt=shared$(comma)$(STAGING) --with-gettext=shared$(comma)$(STAGING) --with-icu-dir=$(STAGING) --with-iconv=shared$(comma)$(STAGING) --with-iconv-dir=$(STAGING) --with-gd=shared --with-freetype-dir=$(STAGING) --with-jpeg-dir=$(STAGING) --with-png-dir=$(STAGING) --with-zlib-dir=$(STAGING) --with-zlib=$(STAGING) --with-bz2=shared$(comma)$(STAGING) --enable-wddx=shared))

# ICU is hard to build.
._icu: $(SOURCES)/icu4c-56_1-src.tgz
	$(RM) -R $(BUILD)/icu
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/icu/source && \
        ./configure --prefix=$(STAGING) --enable-rpath && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# libarchive uses cmake.
._libarchive: $(SOURCES)/libarchive-3.1.2.tar.gz ._bzip2 ._gzip ._libxml2 ._xz ._openssl ._zlib
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
._mysql: $(SOURCES)/mysql-5.6.27.tar.gz ._libncurses ._openssl
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
                   -DWITH_SSL=system \
                   -DWITH_ZLIB=system && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# MySQL Connector/C++ uses cmake.
._mysql-connector-c++: $(SOURCES)/mysql-connector-c++-1.1.6.tar.gz ._boost ._mysql
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(CMAKE) . -DCMAKE_INSTALL_PREFIX=$(STAGING) \
                   -DCMAKE_INSTALL_LIBDIR=lib && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# zookeeper is a big package but I need only a small portion.
._zookeeper: $(SOURCES)/zookeeper-3.4.6.tar.gz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<)))/src/c && \
        $(PATCH) -p1 <'$(PATCHES)/zookeeper.patch' && \
        ./configure --prefix=$(STAGING) && $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# boost, headache.
._boost: $(SOURCES)/boost_$(boost_version).tar.bz2 ._zlib ._bzip2 ._libiconv
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        ./bootstrap.sh --prefix=$(STAGING) \
            --without-libraries=python,graph_parallel,mpi,log && \
        ./b2 include='$(STAGING)/include' linkflags='-L$(STAGING)/lib' \
            variant=release link=shared,static threading=multi install
	$(TOUCH) $@

# libintl and libiconv are two idiots.
._libintl: $(SOURCES)/gettext-0.19.4.tar.xz ._libiconv
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<)))/gettext-runtime && \
        ./configure --prefix=$(STAGING) --disable-rpath \
        --with-included-gettext && $(MAKE) -C intl && $(MAKE) -C intl install
	$(TOUCH) $@

# memcached needs to be reconfigured.
._memcached: $(SOURCES)/memcached-1.4.24.tar.gz ._libevent
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(PATCH) -p1 <$(PATCHES)/memcached.patch && \
        $(AUTORECONF) -fvi && \
        ./configure --prefix=$(STAGING) --bindir=$(STAGING)/sbin && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# zlib needs a libtool archive.
._zlib: $(SOURCES)/zlib-1.2.8.tar.gz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        ./configure --prefix=$(STAGING) && $(MAKE) && $(MAKE) install
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libz.la.in >$(STAGING)/lib/libz.la
	$(TOUCH) $@

# gmock is very special, blame Google.
._gmock: $(SOURCES)/gmock-1.7.0.zip
	$(RM) -R $(BUILD)/$(basename $(notdir $<))
	$(MKDIR) $(BUILD) && cd $(BUILD) && $(UNZIP) $<
	$(MKDIR) $(STAGING)/include
	$(MKDIR) $(STAGING)/lib
	cd $(BUILD)/$(basename $(notdir $<)) && ./configure --prefix=$(STAGING) && $(MAKE) && \
        $(RM) -R $(STAGING)/include/gtest && \
        $(CP) -R gtest/include/gtest $(STAGING)/include && \
        $(RM) -R $(STAGING)/include/gmock && \
        $(CP) -R include/gmock $(STAGING)/include && \
        $(CP) gtest/lib/.libs/libgtest_main.lai $(STAGING)/lib/libgtest_main.la && \
        $(CP) gtest/lib/.libs/libgtest.lai $(STAGING)/lib/libgtest.la && \
        $(CP) gtest/lib/.libs/*.$(SO_S) $(STAGING)/lib && \
        $(CP) gtest/lib/.libs/*.a $(STAGING)/lib && \
        $(CP) lib/.libs/libgmock_main.lai $(STAGING)/lib/libgmock_main.la && \
        $(CP) lib/.libs/libgmock.lai $(STAGING)/lib/libgmock.la && \
        $(CP) lib/.libs/*.$(SO_S) $(STAGING)/lib && \
        $(CP) lib/.libs/*.a $(STAGING)/lib
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
._mysql++: $(SOURCES)/mysql++-3.2.2.tar.gz ._mysql ._libintl
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
._gsoap: $(SOURCES)/gsoap_2.8.23.zip ._openssl
	$(RM) -R $(BUILD)/gsoap-2.8
	$(MKDIR) $(BUILD) && cd $(BUILD) && $(UNZIP) $<
	cd $(BUILD)/gsoap-2.8 && \
        $(PATCH) -p1 <$(PATCHES)/gsoap.patch && \
        $(AUTORECONF) -fvi && \
        CFLAGS="${CFLAGS} ${CPPFLAGS}" CXXFLAGS="${CXXFLAGS} ${CPPFLAGS}" \
        ./configure --prefix=$(STAGING) --enable-ipv6 --with-openssl=$(STAGING) && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# HTTPd needs a little tweak.
._httpd: $(SOURCES)/httpd-2.4.17.tar.bz2 ._apr ._apr-util ._pcre ._openssl ._libxml2 ._nghttp2
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
	$(RM) $(STAGING)/cgi-bin/*
	$(RM) $(STAGING)/htdocs/*
	$(TOUCH) $@

# libcurl needs some tweaks and is sensitive about CFLAGS.
._libcurl: $(SOURCES)/curl-7.45.0.tar.lzma ._c-ares ._openssl ._zlib ._nghttp2
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) &&                               \
        ./configure --prefix=$(STAGING)                                               \
        --enable-http --enable-crypto-auth --enable-ipv6 --enable-tls-srp             \
        --enable-ftp --enable-manual --disable-ldap --disable-ldaps --disable-rtsp    \
        --enable-proxy --disable-dict --disable-telnet --disable-tftp --disable-pop3  \
        --disable-imap --disable-smtp --disable-gopher --disable-file --without-krb4  \
        --without-libidn --without-ca-bundle --without-ca-path --without-gssapi       \
        --disable-libcurl-option --enable-verbose --enable-shared --enable-static     \
        --enable-cookies --enable-symbol-hiding --disable-threaded-resolver           \
        --disable-curldebug --enable-optimize --disable-debug                         \
        --without-librtmp --without-libssh2 --without-winidn --without-libmetalink    \
        --without-axtls --without-nss  --without-cyassl --disable-dependency-tracking \
        --without-gnutls --without-darwinssl --without-winssl --disable-ntlm-wb       \
        --disable-sspi --disable-largefile --without-polarssl --enable-ares &&        \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# OpenSSL has something really weird.
._openssl: $(SOURCES)/openssl-1.0.2d.tar.gz ._zlib
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(PATCH) -p1 <$(PATCHES)/openssl.patch && \
        $(OpenSSL_configure) zlib threads shared no-krb5 no-ssl2 no-ssl3 \
        --prefix=$(STAGING) --openssldir=$(STAGING)/etc/ssl \
        --with-zlib-include=$(STAGING)/include --with-zlib-lib=$(STAGING)/lib && \
        $(MAKE) && $(MAKE) install_sw
	$(CHMOD) +w $(STAGING)/lib/libcrypto.$(SO_S)
	$(CHMOD) +w $(STAGING)/lib/libssl.$(SO_S)
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libcrypto.la.in >$(STAGING)/lib/libcrypto.la
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libssl.la.in >$(STAGING)/lib/libssl.la
	$(TOUCH) $@

# jsoncpp uses cmake.
._jsoncpp: $(SOURCES)/jsoncpp-0.10.5.tar.gz
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(PATCH) -p1 <$(PATCHES)/jsoncpp.patch && \
        $(CMAKE) . -DCMAKE_INSTALL_PREFIX=$(STAGING) \
                   -DBUILD_SHARED_LIBS=ON \
                   -DJSONCPP_WITH_TESTS=OFF \
                   -DJSONCPP_WITH_PKGCONFIG_SUPPORT=ON \
                   -DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF && \
        $(MAKE) && $(MAKE) install
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libjsoncpp.la.in >$(STAGING)/lib/libjsoncpp.la
	$(TOUCH) $@

# logrotate is also a geek.
._logrotate: $(SOURCES)/logrotate-3.9.1.tar.gz ._libpopt
	$(RM) -R $(BUILD)/$(basename $(basename $(notdir $<)))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(basename $(notdir $<))) && \
        $(PATCH) -p1 <$(PATCHES)/logrotate.patch && \
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

# TinyXML is really not friendly.
._tinyxml: $(SOURCES)/tinyxml_2_6_2.tar.gz
	$(RM) -R $(BUILD)/tinyxml
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/tinyxml && \
        $(PATCH) -p1 <$(PATCHES)/tinyxml.patch && \
        $(MAKE) && \
        $(CP) tinyxml.h $(STAGING)/include/ && \
        $(CP) libtinyxml.a libtinyxml.$(SO_S) $(STAGING)/lib/
	$(SED) -e 's|@libdir@|$(STAGING)/lib|g' lib/$(MACOSX)libtinyxml.la.in >$(STAGING)/lib/libtinyxml.la
	$(TOUCH) $@

# Nginx is naughty about dependencies.
._nginx: $(SOURCES)/nginx-1.8.0.tar.gz ._openssl ._pcre
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
                     --with-http_ssl_module \
                     --with-http_spdy_module \
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
._php5-memcached: $(SOURCES)/memcached-2.2.0.tgz ._php5 ._libmemcached ._zlib
	$(RM) -R $(BUILD)/$(basename $(notdir $<))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(notdir $<)) && \
        $(STAGING)/bin/phpize && \
        ./configure --prefix=$(STAGING) --with-libmemcached-dir=$(STAGING) \
                    --with-zlib-dir=$(STAGING) --disable-memcached-sasl && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# It's a PHP module.
._php5-uuid: $(SOURCES)/uuid-1.0.4.tgz ._php5 ._util-linux
	$(RM) -R $(BUILD)/$(basename $(notdir $<))
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/$(basename $(notdir $<)) && \
        $(STAGING)/bin/phpize && \
        ./configure --prefix=$(STAGING) --with-uuid=$(STAGING) && \
        $(MAKE) && $(MAKE) install
	$(TOUCH) $@

# libjpeg, quite old.
._libjpeg: $(SOURCES)/jpegsrc.v9a.tar.gz
	$(RM) -R $(BUILD)/jpeg-9a
	$(MKDIR) $(BUILD) && cd $(BUILD) && tar -xaf $<
	cd $(BUILD)/jpeg-9a && \
        ./configure --prefix=$(STAGING) --enable-shared --enable-static && \
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
