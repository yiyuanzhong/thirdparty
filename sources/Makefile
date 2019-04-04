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

$(eval $(call M,590150223da115aec712fa86cb693807,apcu-5.1.12.tgz,https://pecl.php.net/get/apcu-5.1.12.tgz))
$(eval $(call M,a67ca9fcf9c4ff59bce7f428a323c8b5e18667fdea7b0ebad47d194371b0a105,apr-1.6.5.tar.bz2,http://www-us.apache.org/dist/apr/apr-1.6.5.tar.bz2))
$(eval $(call M,d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b,apr-util-1.6.1.tar.bz2,http://www-us.apache.org/dist/apr/apr-util-1.6.1.tar.bz2))
$(eval $(call M,50f97f4159805e374639a73e2636f22e,autoconf-2.69.tar.xz,https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz))
$(eval $(call M,53f38e7591fa57c3d2cee682be668e5b,automake-1.16.1.tar.xz,https://ftp.gnu.org/gnu/automake/automake-1.16.1.tar.xz))
$(eval $(call M,3e54f20988ecd1b62044e25481e5f06b,bison-3.0.5.tar.xz,https://ftp.gnu.org/gnu/bison/bison-3.0.5.tar.xz))
$(eval $(call M,6aa9a5c6a4ca1016edd0ed1178e3cb87,boost_1_59_0.tar.bz2,https://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.bz2/download))
$(eval $(call M,00b516f4704d4a7cb50a1d97e6e8e15b,bzip2-1.0.6.tar.gz,https://fossies.org/linux/misc/bzip2-1.0.6.tar.gz))
$(eval $(call M,e57b37a7c46283e83c21cde234df10c7,c-ares-1.14.0.tar.gz,http://c-ares.haxx.se/download/c-ares-1.14.0.tar.gz))
$(eval $(call M,2bf8d1d1ee345fc8a7915576f5649982,chrpath-0.16.tar.gz,https://src.fedoraproject.org/lookaside/extras/chrpath/chrpath-0.16.tar.gz/2bf8d1d1ee345fc8a7915576f5649982/chrpath-0.16.tar.gz))
$(eval $(call M,b8c0c7fbe0ef5e06e0c935f134304d44,clearsilver-0.10.5.tar.gz,http://www.clearsilver.net/downloads/clearsilver-0.10.5.tar.gz))
$(eval $(call M,7410851a783a41b521214ad987bb534a7e4a65e059651a2514e6ebfc8f46b218,cmake-3.9.6.tar.gz,https://cmake.org/files/v3.9/cmake-3.9.6.tar.gz))
$(eval $(call M,ab06d68949758971fe744db66b572816,coreutils-8.30.tar.xz,https://ftp.gnu.org/gnu/coreutils/coreutils-8.30.tar.xz))
$(eval $(call M,feb1856fcdb79ba0386c8e41b02e487d,curl-7.61.1.tar.xz,https://curl.haxx.se/download/curl-7.61.1.tar.xz))
$(eval $(call M,07cf286672ced26fba54cd0313bdc071,diffutils-3.6.tar.xz,https://ftp.gnu.org/gnu/diffutils/diffutils-3.6.tar.xz))
$(eval $(call M,b6ccd2705cf8e732707eb4132a1c4dbc,libexpat-R_2_2_6.tar.gz,https://github.com/libexpat/libexpat/archive/R_2_2_6.tar.gz))
$(eval $(call M,9936aa8009438ce185bea2694a997fc1,findutils-4.6.0.tar.gz,https://ftp.gnu.org/gnu/findutils/findutils-4.6.0.tar.gz))
$(eval $(call M,2882e3179748cc9f9c23ec593d6adc8d,flex-2.6.4.tar.gz,https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz))
$(eval $(call M,220c82062171c513e4017c523d196933c9de4a7d,freetype-2.9.1.tar.bz2,https://sourceforge.net/projects/freetype/files/freetype2/2.9.1/freetype-2.9.1.tar.bz2/download))
$(eval $(call M,95cf553f50ec9f386b5dfcd67f30180a,gawk-4.2.1.tar.xz,https://ftp.gnu.org/gnu/gawk/gawk-4.2.1.tar.xz))
$(eval $(call M,df3f5690eaa30fd228537b00cb7b7590,gettext-0.19.8.1.tar.xz,https://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz))
$(eval $(call M,2e6fbeb6a91310a16efe181886c59596,googletest-release-1.8.1.tar.gz,https://github.com/google/googletest/archive/release-1.8.1.tar.gz))
$(eval $(call M,f58fa8001d60c4c77595fbbb62b63c1d,gmp-6.1.2.tar.xz,https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz))
$(eval $(call M,c6a852a817e9160c79bdb2d3101b4601,gperftools-2.7.tar.gz,https://github.com/gperftools/gperftools/releases/download/gperftools-2.7/gperftools-2.7.tar.gz))
$(eval $(call M,feca7b3e7c7f4aab2b42ecbfc513b070,grep-3.1.tar.xz,https://ftp.gnu.org/gnu/grep/grep-3.1.tar.xz))
$(eval $(call M,de813ca24d46b2e5f80793873c0d04992a8f0822,gsoap_2.8.70.zip,https://sourceforge.net/projects/gsoap2/files/gsoap-2.8/gsoap_2.8.70.zip/download))
$(eval $(call M,929d6a6b832f75b28e3eeeafb30c1d9b,gzip-1.9.tar.gz,https://ftp.gnu.org/gnu/gzip/gzip-1.9.tar.gz))
$(eval $(call M,6d565680a4af0d2e261abbc3e3431b2b,hiredis-0.14.0.tar.gz,https://github.com/redis/hiredis/archive/v0.14.0.tar.gz))
$(eval $(call M,b4ca9d05773aa59b54d66cd8f4744b945289f084d3be17d7981d1783a5decfa2,httpd-2.4.39.tar.bz2,http://www-us.apache.org/dist/httpd/httpd-2.4.39.tar.bz2))
$(eval $(call M,fac212b32b7ec7ab007a12dff1f3aea1,icu4c-58_2-src.tgz,http://download.icu-project.org/files/icu4c/58.2/icu4c-58_2-src.tgz))
$(eval $(call M,93c62597eeef81a84d988bccbda1e990,jpeg-9c.tar.gz,http://ijg.org/files/jpegsrc.v9c.tar.gz))
$(eval $(call M,13d1991d79697df8cadbc25c93e37c83,jsoncpp-0.10.6.tar.gz,https://github.com/open-source-parsers/jsoncpp/archive/0.10.6.tar.gz))
$(eval $(call M,4038e366ca5b659dae3efcc744e72120,libarchive-3.3.3.tar.gz,http://libarchive.org/downloads/libarchive-3.3.3.tar.gz))
$(eval $(call M,94459a5a22db041dec6f98424d6efe54,libev-4.24.tar.gz,http://dist.schmorp.de/libev/libev-4.24.tar.gz))
$(eval $(call M,f3eeaed018542963b7d2416ef1135ecc,libevent-2.1.8-stable.tar.gz,https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz))
$(eval $(call M,32f09f98ad52e11177d2400716749b9f,libfcgi-2.4.0.orig.tar.gz,http://http.debian.net/debian/pool/main/libf/libfcgi/libfcgi_2.4.0.orig.tar.gz))
$(eval $(call M,5d966cd1b56897543afeaac6eaca6888,libhugetlbfs-2.21.tar.gz,https://github.com/libhugetlbfs/libhugetlbfs/releases/download/2.21/libhugetlbfs-2.21.tar.gz))
$(eval $(call M,ace8b5f2db42f7b3b3057585e80d9808,libiconv-1.15.tar.gz,https://ftp.gnu.org/gnu/libiconv/libiconv-1.15.tar.gz))
$(eval $(call M,c4f491dd411a09e9de3b8702ea6f73eb,libmcrypt-2.5.8.tar.bz2,https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.bz2/download))
$(eval $(call M,b3958716b4e53ddc5992e6c49d97e819,libmemcached-1.0.18.tar.gz,https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz))
$(eval $(call M,0df1561aa1da610e892239348970d574b14deed0,libpng-1.6.35.tar.xz,https://sourceforge.net/projects/libpng/files/libpng16/1.6.35/libpng-1.6.35.tar.xz/download))
$(eval $(call M,1bfb9b923f2c1339b4d2ce1807064aa5,libtool-2.4.6.tar.xz,https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz))
$(eval $(call M,b786e353e2aa1b872d70d5d1ca0c740d,libxml2-2.9.8.tar.gz,ftp://xmlsoft.org/libxml2/libxml2-2.9.8.tar.gz))
$(eval $(call M,1fc72f98e98bf4443f1651165f3aa146,libxslt-1.1.32.tar.gz,ftp://xmlsoft.org/libxml2/libxslt-1.1.32.tar.gz))
$(eval $(call M,1c0f6e6e490c4bcac0a1e77ad1310683,logrotate-3.14.0.tar.xz,https://github.com/logrotate/logrotate/releases/download/3.14.0/logrotate-3.14.0.tar.xz))
$(eval $(call M,730bb15d96fffe47e148d1e09235af82,m4-1.4.18.tar.xz,https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz))
$(eval $(call M,15b012617e7c44c0ed482721629577ac,make-4.2.1.tar.bz2,https://ftp.gnu.org/gnu/make/make-4.2.1.tar.bz2))
$(eval $(call M,59b800337ae4bb164b85a5779fa5b72d5f9af66c,memcached-1.5.11.tar.gz,http://www.memcached.org/files/memcached-1.5.11.tar.gz))
$(eval $(call M,7e37aae409be7fc25ac31f918f5fa2eb,memcached-3.0.4.tgz,https://pecl.php.net/get/memcached-3.0.4.tgz))
$(eval $(call M,f0b6d87dfcfe18b318905a3f91274051f3f17945,mod_fcgid-2.3.9.tar.bz2,http://www-us.apache.org/dist/httpd/mod_fcgid/mod_fcgid-2.3.9.tar.bz2))
$(eval $(call M,4125404e41e482ec68282a2e687f6c73,mpc-1.1.0.tar.gz,https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz))
$(eval $(call M,b8dd19bd9bb1ec8831a6a582a7308073,mpfr-4.0.1.tar.xz,https://ftp.gnu.org/gnu/mpfr/mpfr-4.0.1.tar.xz))
$(eval $(call M,cda38b5ecc0117de91f7c42292dd1e79,mysql++-3.2.4.tar.gz,https://tangentsoft.com/mysqlpp/releases/mysql++-3.2.4.tar.gz))
$(eval $(call M,3398bb99df0ca926f161d56e9cefa73d,mysql-5.7.23.tar.gz,http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.23.tar.gz))
$(eval $(call M,e0babea574c236dd53124831ce9c73ee,mysql-connector-c++-1.1.11.tar.gz,http://dev.mysql.com/get/Downloads/Connector-C++/mysql-connector-c++-1.1.11.tar.gz))
$(eval $(call M,98c889aaf8d23910d2b92d65be2e737a,ncurses-6.1.tar.gz,https://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz))
$(eval $(call M,77f2a1d5359ec2274b3de8e9d80587ba,nghttp2-1.34.0.tar.xz,https://github.com/nghttp2/nghttp2/releases/download/v1.34.0/nghttp2-1.34.0.tar.xz))
$(eval $(call M,2d856aca3dfe1d32e3c9f8c4cac0cc95,nginx-1.14.0.tar.gz,http://nginx.org/download/nginx-1.14.0.tar.gz))
$(eval $(call M,5c557b023230413dfb0756f3137a13e6d726838ccd1430888ad15bfb2b43ea4b,openssl-1.1.1b.tar.gz,https://www.openssl.org/source/openssl-1.1.1b.tar.gz))
$(eval $(call M,78ad9937e4caadcba1526ef1853730d5,patch-2.7.6.tar.xz,https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz))
$(eval $(call M,df0d1c2ff04c359220cb902539a6e134af4497f4,pcre-8.42.tar.bz2,https://sourceforge.net/projects/pcre/files/pcre/8.42/pcre-8.42.tar.bz2/download))
$(eval $(call M,da1a705c0bc46410e330fc6baa967666c8cd2985378fb9707c01a8e33b01d985,php-7.2.11.tar.xz,http://php.net/get/php-7.2.11.tar.xz/from/this/mirror))
$(eval $(call M,f6e931e319531b736fadc017f470e68a,pkg-config-0.29.2.tar.gz,http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz))
$(eval $(call M,3743beefa3dd6247a73f8f7a32c14c33,popt-1.16.tar.gz,http://rpm5.org/files/popt/popt-1.16.tar.gz))
$(eval $(call M,ff6742018c172c66ecc627029ad54280,protobuf-3.5.2.tar.gz,https://github.com/google/protobuf/archive/v3.5.2.tar.gz))
$(eval $(call M,205b03a87fc83dab653b628c59b9fc91,readline-7.0.tar.gz,https://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz))
$(eval $(call M,ade8f8c2c548bf41f74db2dcfc37e4e3,sed-4.5.tar.xz,https://ftp.gnu.org/gnu/sed/sed-4.5.tar.xz))
$(eval $(call M,aedfbdc14eb700099434d6a743135743cff47393,sqlite-autoconf-3250200.tar.gz,https://www.sqlite.org/2018/sqlite-autoconf-3250200.tar.gz))
$(eval $(call M,2d01c6cd1387be98f57a0ec4e6e35826,tar-1.30.tar.xz,https://ftp.gnu.org/gnu/tar/tar-1.30.tar.xz))
$(eval $(call M,0be59730ebce071eceaf6bfdb8d3a20e,thrift-0.11.0.tar.gz,http://www-us.apache.org/dist/thrift/0.11.0/thrift-0.11.0.tar.gz))
$(eval $(call M,62b490407489521db863b523a7f86375,unzip60.tar.gz,https://sourceforge.net/projects/infozip/files/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz/download))
$(eval $(call M,54ba880f1d66782c2287ee2c898520e9,util-linux-2.21.2.tar.xz,https://www.kernel.org/pub/linux/utils/util-linux/v2.21/util-linux-2.21.2.tar.xz))
$(eval $(call M,1695511daf585fcaf7816a401a6216f6,uuid-1.0.4.tgz,https://pecl.php.net/get/uuid-1.0.4.tgz))
$(eval $(call M,097ff1a324ae02e0a3b0369f07a7544a,which-2.21.tar.gz,https://ftp.gnu.org/gnu/which/which-2.21.tar.gz))
$(eval $(call M,b3264b15ab1db04c8c428dc81838d4eb,xz-5.2.4.tar.bz2,https://tukaani.org/xz/xz-5.2.4.tar.bz2))
$(eval $(call M,85adef240c5f370b308da8c938951a68,zlib-1.2.11.tar.xz,https://sourceforge.net/projects/libpng/files/zlib/1.2.11/zlib-1.2.11.tar.xz/download))
$(eval $(call M,a989b527f3f990d471e6d47ee410e57d8be7620b,zookeeper-3.4.13.tar.gz,http://www-us.apache.org/dist/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz))
