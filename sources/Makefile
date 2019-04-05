CURL := curl --connect-timeout 10 --ftp-pasv --retry 3 --retry-delay 1 -L --max-redirs 3 --insecure --silent --show-error
SHA256SUM := (sha256sum -b | awk '{print $$1; F=1}END{exit !F}' || openssl sha256) 2>/dev/null
SHA1SUM := (sha1sum -b | awk '{print $$1; F=1}END{exit !F}' || openssl sha1) 2>/dev/null
MD5SUM := (md5sum -b | awk '{print $$1; F=1}END{exit !F}' || md5 || openssl md5) 2>/dev/null
FALSE := false
ECHO := echo
EXPR := expr
RM := rm -fv
MV := mv -f
AWK := awk
CAT := cat

all::
check::
.PHONY::

AT :=
V := 0
ifeq ($(V),0)
AT := @
endif

define M
.PHONY:: check/$(2)
check:: check/$(2)
all:: $(2)
$(2):
	$(AT)$$(ECHO) 'Downloading $(2)'
	$(AT)$$(CURL) -o $(2).dl '$(3)' || ($$(RM) $(2).dl; $$(FALSE))
	$(AT)$$(ECHO) -n 'Checking $(2)...'
	$(AT)if [ 64 -eq `expr '$(1)' : '.*'` ] && [ `$$(CAT) '$(2).dl' | $$(SHA256SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       elif [ 40 -eq `expr '$(1)' : '.*'` ] && [ `$$(CAT) '$(2).dl' | $$(SHA1SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       elif [ 32 -eq `expr '$(1)' : '.*'` ] && [ `$$(CAT) '$(2).dl' | $$(MD5SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       else $$(ECHO) 'bad'; $$(RM) '$(2)'; $$(FALSE); fi
	$(AT)$$(MV) $(2).dl $(2)
check/$(2): $(2)
	$(AT)$$(ECHO) -n 'Checking $(2)...'
	$(AT)if [ 64 -eq `expr '$(1)' : '.*'` ] && [ `$$(CAT) '$(2)' | $$(SHA256SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       elif [ 40 -eq `expr '$(1)' : '.*'` ] && [ `$$(CAT) '$(2)' | $$(SHA1SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       elif [ 32 -eq `expr '$(1)' : '.*'` ] && [ `$$(CAT) '$(2)' | $$(MD5SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       else $$(ECHO) 'bad'; $$(RM) '$(2)'; $$(FALSE); fi
endef

$(eval $(call M,6b11b477890a9c096ad856e0251920d1d8b9558b7d115256c027e0223755c793,apcu-5.1.17.tgz,https://pecl.php.net/get/apcu-5.1.17.tgz))
$(eval $(call M,a67ca9fcf9c4ff59bce7f428a323c8b5e18667fdea7b0ebad47d194371b0a105,apr-1.6.5.tar.bz2,http://www-us.apache.org/dist/apr/apr-1.6.5.tar.bz2))
$(eval $(call M,d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b,apr-util-1.6.1.tar.bz2,http://www-us.apache.org/dist/apr/apr-util-1.6.1.tar.bz2))
$(eval $(call M,50f97f4159805e374639a73e2636f22e,autoconf-2.69.tar.xz,https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz))
$(eval $(call M,53f38e7591fa57c3d2cee682be668e5b,automake-1.16.1.tar.xz,https://ftp.gnu.org/gnu/automake/automake-1.16.1.tar.xz))
$(eval $(call M,039ee45b61d95e5003e7e8376f9080001b4066ff357bde271b7faace53b9d804,bison-3.3.2.tar.xz,https://ftp.gnu.org/gnu/bison/bison-3.3.2.tar.xz))
$(eval $(call M,6aa9a5c6a4ca1016edd0ed1178e3cb87,boost_1_59_0.tar.bz2,https://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.bz2/download))
$(eval $(call M,00b516f4704d4a7cb50a1d97e6e8e15b,bzip2-1.0.6.tar.gz,https://fossies.org/linux/misc/bzip2-1.0.6.tar.gz))
$(eval $(call M,6cdb97871f2930530c97deb7cf5c8fa4be5a0b02c7cea6e7c7667672a39d6852,c-ares-1.15.0.tar.gz,http://c-ares.haxx.se/download/c-ares-1.15.0.tar.gz))
$(eval $(call M,2bf8d1d1ee345fc8a7915576f5649982,chrpath-0.16.tar.gz,https://src.fedoraproject.org/lookaside/extras/chrpath/chrpath-0.16.tar.gz/2bf8d1d1ee345fc8a7915576f5649982/chrpath-0.16.tar.gz))
$(eval $(call M,b8c0c7fbe0ef5e06e0c935f134304d44,clearsilver-0.10.5.tar.gz,http://www.clearsilver.net/downloads/clearsilver-0.10.5.tar.gz))
$(eval $(call M,7410851a783a41b521214ad987bb534a7e4a65e059651a2514e6ebfc8f46b218,cmake-3.9.6.tar.gz,https://cmake.org/files/v3.9/cmake-3.9.6.tar.gz))
$(eval $(call M,ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd,coreutils-8.31.tar.xz,https://ftp.gnu.org/gnu/coreutils/coreutils-8.31.tar.xz))
$(eval $(call M,9252332a7f871ce37bfa7f78bdd0a0e3924d8187cc27cb57c76c9474a7168fb3,curl-7.64.1.tar.xz,https://curl.haxx.se/download/curl-7.64.1.tar.xz))
$(eval $(call M,b3a7a6221c3dc916085f0d205abf6b8e1ba443d4dd965118da364a1dc1cb3a26,diffutils-3.7.tar.xz,https://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz))
$(eval $(call M,b6ccd2705cf8e732707eb4132a1c4dbc,libexpat-R_2_2_6.tar.gz,https://github.com/libexpat/libexpat/archive/R_2_2_6.tar.gz))
$(eval $(call M,9936aa8009438ce185bea2694a997fc1,findutils-4.6.0.tar.gz,https://ftp.gnu.org/gnu/findutils/findutils-4.6.0.tar.gz))
$(eval $(call M,2882e3179748cc9f9c23ec593d6adc8d,flex-2.6.4.tar.gz,https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz))
$(eval $(call M,220c82062171c513e4017c523d196933c9de4a7d,freetype-2.9.1.tar.bz2,https://sourceforge.net/projects/freetype/files/freetype2/2.9.1/freetype-2.9.1.tar.bz2/download))
$(eval $(call M,95cf553f50ec9f386b5dfcd67f30180a,gawk-4.2.1.tar.xz,https://ftp.gnu.org/gnu/gawk/gawk-4.2.1.tar.xz))
$(eval $(call M,df3f5690eaa30fd228537b00cb7b7590,gettext-0.19.8.1.tar.xz,https://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz))
$(eval $(call M,2e6fbeb6a91310a16efe181886c59596,googletest-release-1.8.1.tar.gz,https://github.com/google/googletest/archive/release-1.8.1.tar.gz))
$(eval $(call M,f58fa8001d60c4c77595fbbb62b63c1d,gmp-6.1.2.tar.xz,https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz))
$(eval $(call M,c6a852a817e9160c79bdb2d3101b4601,gperftools-2.7.tar.gz,https://github.com/gperftools/gperftools/releases/download/gperftools-2.7/gperftools-2.7.tar.gz))
$(eval $(call M,b960541c499619efd6afe1fa795402e4733c8e11ebf9fafccc0bb4bccdc5b514,grep-3.3.tar.xz,https://ftp.gnu.org/gnu/grep/grep-3.3.tar.xz))
$(eval $(call M,a424b8e398a356df408bf67e0aa72779c2a691d2,gsoap_2.8.82.zip,https://sourceforge.net/projects/gsoap2/files/gsoap-2.8/gsoap_2.8.82.zip/download))
$(eval $(call M,c91f74430bf7bc20402e1f657d0b252cb80aa66ba333a25704512af346633c68,gzip-1.10.tar.gz,https://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.gz))
$(eval $(call M,6d565680a4af0d2e261abbc3e3431b2b,hiredis-0.14.0.tar.gz,https://github.com/redis/hiredis/archive/v0.14.0.tar.gz))
$(eval $(call M,b4ca9d05773aa59b54d66cd8f4744b945289f084d3be17d7981d1783a5decfa2,httpd-2.4.39.tar.bz2,http://www-us.apache.org/dist/httpd/httpd-2.4.39.tar.bz2))
$(eval $(call M,fac212b32b7ec7ab007a12dff1f3aea1,icu4c-58_2-src.tgz,http://download.icu-project.org/files/icu4c/58.2/icu4c-58_2-src.tgz))
$(eval $(call M,93c62597eeef81a84d988bccbda1e990,jpeg-9c.tar.gz,http://ijg.org/files/jpegsrc.v9c.tar.gz))
$(eval $(call M,13d1991d79697df8cadbc25c93e37c83,jsoncpp-0.10.6.tar.gz,https://github.com/open-source-parsers/jsoncpp/archive/0.10.6.tar.gz))
$(eval $(call M,62cf871ad8fd09eb3418f00aca7a7d449299b8e1de31c65f28bf6a2ef1fa502a,libaio-0.3.111.tar.gz,https://releases.pagure.org/libaio/libaio-0.3.111.tar.gz))
$(eval $(call M,4038e366ca5b659dae3efcc744e72120,libarchive-3.3.3.tar.gz,http://libarchive.org/downloads/libarchive-3.3.3.tar.gz))
$(eval $(call M,78757e1c27778d2f3795251d9fe09715d51ce0422416da4abb34af3929c02589,libev-4.25.tar.gz,http://dist.schmorp.de/libev/libev-4.25.tar.gz))
$(eval $(call M,f3eeaed018542963b7d2416ef1135ecc,libevent-2.1.8-stable.tar.gz,https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz))
$(eval $(call M,32f09f98ad52e11177d2400716749b9f,libfcgi-2.4.0.orig.tar.gz,http://http.debian.net/debian/pool/main/libf/libfcgi/libfcgi_2.4.0.orig.tar.gz))
$(eval $(call M,5d966cd1b56897543afeaac6eaca6888,libhugetlbfs-2.21.tar.gz,https://github.com/libhugetlbfs/libhugetlbfs/releases/download/2.21/libhugetlbfs-2.21.tar.gz))
$(eval $(call M,ace8b5f2db42f7b3b3057585e80d9808,libiconv-1.15.tar.gz,https://ftp.gnu.org/gnu/libiconv/libiconv-1.15.tar.gz))
$(eval $(call M,c4f491dd411a09e9de3b8702ea6f73eb,libmcrypt-2.5.8.tar.bz2,https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.bz2/download))
$(eval $(call M,b3958716b4e53ddc5992e6c49d97e819,libmemcached-1.0.18.tar.gz,https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz))
$(eval $(call M,eceb924c1fa6b79172fdfd008d335f0e59172a86a66481e09d4089df872aa319,libpng-1.6.36.tar.xz,https://sourceforge.net/projects/libpng/files/libpng16/1.6.36/libpng-1.6.36.tar.xz/download))
$(eval $(call M,1bfb9b923f2c1339b4d2ce1807064aa5,libtool-2.4.6.tar.xz,https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz))
$(eval $(call M,94fb70890143e3c6549f265cee93ec064c80a84c42ad0f23e85ee1fd6540a871,libxml2-2.9.9.tar.gz,ftp://xmlsoft.org/libxml2/libxml2-2.9.9.tar.gz))
$(eval $(call M,8e36605144409df979cab43d835002f63988f3dc94d5d3537c12796db90e38c8,libxslt-1.1.33.tar.gz,ftp://xmlsoft.org/libxml2/libxslt-1.1.33.tar.gz))
$(eval $(call M,313612c4776a305393454c874ef590d8acf84c9ffa648717731dfe902284ff8f,logrotate-3.15.0.tar.xz,https://github.com/logrotate/logrotate/releases/download/3.15.0/logrotate-3.15.0.tar.xz))
$(eval $(call M,33af5936ac06536805f9745e0b6d61da606a1f8b4cc5c04dd3cbaca3b9b4fc43,lz4-1.8.3.tar.gz,https://github.com/lz4/lz4/archive/v1.8.3.tar.gz))
$(eval $(call M,730bb15d96fffe47e148d1e09235af82,m4-1.4.18.tar.xz,https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz))
$(eval $(call M,15b012617e7c44c0ed482721629577ac,make-4.2.1.tar.bz2,https://ftp.gnu.org/gnu/make/make-4.2.1.tar.bz2))
$(eval $(call M,f67096ba64b0c47668bcad5b680010c4f8987d4c,memcached-1.5.12.tar.gz,http://www.memcached.org/files/memcached-1.5.12.tar.gz))
$(eval $(call M,7e37aae409be7fc25ac31f918f5fa2eb,memcached-3.0.4.tgz,https://pecl.php.net/get/memcached-3.0.4.tgz))
$(eval $(call M,f0b6d87dfcfe18b318905a3f91274051f3f17945,mod_fcgid-2.3.9.tar.bz2,http://www-us.apache.org/dist/httpd/mod_fcgid/mod_fcgid-2.3.9.tar.bz2))
$(eval $(call M,4125404e41e482ec68282a2e687f6c73,mpc-1.1.0.tar.gz,https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz))
$(eval $(call M,1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a,mpfr-4.0.2.tar.xz,https://ftp.gnu.org/gnu/mpfr/mpfr-4.0.2.tar.xz))
$(eval $(call M,cda38b5ecc0117de91f7c42292dd1e79,mysql++-3.2.4.tar.gz,https://tangentsoft.com/mysqlpp/releases/mysql++-3.2.4.tar.gz))
$(eval $(call M,3bfacf8605b8f62c15313c6aa11492e1,mysql-5.7.25.tar.gz,http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.25.tar.gz))
$(eval $(call M,de2708609f4ca7ff6110cd594446030a,mysql-connector-c++-1.1.12.tar.gz,http://dev.mysql.com/get/Downloads/Connector-C++/mysql-connector-c++-1.1.12.tar.gz))
$(eval $(call M,98c889aaf8d23910d2b92d65be2e737a,ncurses-6.1.tar.gz,https://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz))
$(eval $(call M,aa090b164b17f4b91fe32310a1c0edf3e97e02cd9d1524eef42d60dd1e8d47b7,nghttp2-1.37.0.tar.xz,https://github.com/nghttp2/nghttp2/releases/download/v1.37.0/nghttp2-1.37.0.tar.xz))
$(eval $(call M,002d9f6154e331886a2dd4e6065863c9c1cf8291ae97a1255308572c02be9797,nginx-1.14.2.tar.gz,http://nginx.org/download/nginx-1.14.2.tar.gz))
$(eval $(call M,5c557b023230413dfb0756f3137a13e6d726838ccd1430888ad15bfb2b43ea4b,openssl-1.1.1b.tar.gz,https://www.openssl.org/source/openssl-1.1.1b.tar.gz))
$(eval $(call M,78ad9937e4caadcba1526ef1853730d5,patch-2.7.6.tar.xz,https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz))
$(eval $(call M,91e762520003013834ac1adb4a938d53b22a216341c061b0cf05603b290faf6b,pcre-8.43.tar.bz2,https://sourceforge.net/projects/pcre/files/pcre/8.43/pcre-8.43.tar.bz2/download))
$(eval $(call M,a3e5f51a9ae08813b3925bea3a4de02cd4906fcccf75646e267a213bb63bcf84,php-7.2.17.tar.xz,http://php.net/get/php-7.2.17.tar.xz/from/this/mirror))
$(eval $(call M,f6e931e319531b736fadc017f470e68a,pkg-config-0.29.2.tar.gz,http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz))
$(eval $(call M,3743beefa3dd6247a73f8f7a32c14c33,popt-1.16.tar.gz,http://rpm5.org/files/popt/popt-1.16.tar.gz))
$(eval $(call M,ff6742018c172c66ecc627029ad54280,protobuf-3.5.2.tar.gz,https://github.com/google/protobuf/archive/v3.5.2.tar.gz))
$(eval $(call M,205b03a87fc83dab653b628c59b9fc91,readline-7.0.tar.gz,https://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz))
$(eval $(call M,2885768cd0a29ff8d58a6280a270ff161f6a3deb5690b2be6c49f46d4c67bd6a,sed-4.7.tar.xz,https://ftp.gnu.org/gnu/sed/sed-4.7.tar.xz))
$(eval $(call M,5f5750e3f39b7b60394a2fb6ddb2371f848670e6,sqlite-autoconf-3270200.tar.gz,https://www.sqlite.org/2019/sqlite-autoconf-3270200.tar.gz))
$(eval $(call M,d0d3ae07f103323be809bc3eac0dcc386d52c5262499fe05511ac4788af1fdd8,tar-1.32.tar.xz,https://ftp.gnu.org/gnu/tar/tar-1.32.tar.xz))
$(eval $(call M,3deebbb4d1ca77dd9c9e009a1ea02183,thrift-0.12.0.tar.gz,http://www-us.apache.org/dist/thrift/0.12.0/thrift-0.12.0.tar.gz))
$(eval $(call M,62b490407489521db863b523a7f86375,unzip60.tar.gz,https://sourceforge.net/projects/infozip/files/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz/download))
$(eval $(call M,c14bd9f3b6e1792b90db87696e87ec643f9d63efa0a424f092a5a6b2f2dbef21,util-linux-2.33.1.tar.xz,https://www.kernel.org/pub/linux/utils/util-linux/v2.33/util-linux-2.33.1.tar.xz))
$(eval $(call M,1695511daf585fcaf7816a401a6216f6,uuid-1.0.4.tgz,https://pecl.php.net/get/uuid-1.0.4.tgz))
$(eval $(call M,097ff1a324ae02e0a3b0369f07a7544a,which-2.21.tar.gz,https://ftp.gnu.org/gnu/which/which-2.21.tar.gz))
$(eval $(call M,b3264b15ab1db04c8c428dc81838d4eb,xz-5.2.4.tar.bz2,https://tukaani.org/xz/xz-5.2.4.tar.bz2))
$(eval $(call M,85adef240c5f370b308da8c938951a68,zlib-1.2.11.tar.xz,https://sourceforge.net/projects/libpng/files/zlib/1.2.11/zlib-1.2.11.tar.xz/download))
$(eval $(call M,b14f7a0fece8bd34c7fffa46039e563ac5367607c612517aa7bd37306afbd1cd,zookeeper-3.4.14.tar.gz,http://www-us.apache.org/dist/zookeeper/zookeeper-3.4.14/zookeeper-3.4.14.tar.gz))
