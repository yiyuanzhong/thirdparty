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
	$(AT)if [ 64 -eq `expr length '$(1)'` ] && [ `$$(CAT) '$(2).dl' | $$(SHA256SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       elif [ 40 -eq `expr length '$(1)'` ] && [ `$$(CAT) '$(2).dl' | $$(SHA1SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       elif [ 32 -eq `expr length '$(1)'` ] && [ `$$(CAT) '$(2).dl' | $$(MD5SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       else $$(ECHO) 'bad'; $$(RM) '$(2)'; $$(FALSE); fi
	$(AT)$$(MV) $(2).dl $(2)
check/$(2): $(2)
	$(AT)$$(ECHO) -n 'Checking $(2)...'
	$(AT)if [ 64 -eq `expr length '$(1)'` ] && [ `$$(CAT) '$(2)' | $$(SHA256SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       elif [ 40 -eq `expr length '$(1)'` ] && [ `$$(CAT) '$(2)' | $$(SHA1SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       elif [ 32 -eq `expr length '$(1)'` ] && [ `$$(CAT) '$(2)' | $$(MD5SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       else $$(ECHO) 'bad'; $$(RM) '$(2)'; $$(FALSE); fi
endef

$(eval $(call M,0ef8be2ee8acb4dba5a66b247a254995,apcu-5.1.8.tgz,https://pecl.php.net/get/apcu-5.1.8.tgz))
$(eval $(call M,131f06d16d7aabd097fa992a33eec2b6af3962f93e6d570a9bd4d85e95993172,apr-1.6.3.tar.bz2,http://www-us.apache.org/dist/apr/apr-1.6.3.tar.bz2))
$(eval $(call M,d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b,apr-util-1.6.1.tar.bz2,http://www-us.apache.org/dist/apr/apr-util-1.6.1.tar.bz2))
$(eval $(call M,50f97f4159805e374639a73e2636f22e,autoconf-2.69.tar.xz,https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz))
$(eval $(call M,53f38e7591fa57c3d2cee682be668e5b,automake-1.16.1.tar.xz,https://ftp.gnu.org/gnu/automake/automake-1.16.1.tar.xz))
$(eval $(call M,c342201de104cc9ce0a21e0ad10d4021,bison-3.0.4.tar.xz,https://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.xz))
$(eval $(call M,6aa9a5c6a4ca1016edd0ed1178e3cb87,boost_1_59_0.tar.bz2,https://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.bz2/download))
$(eval $(call M,00b516f4704d4a7cb50a1d97e6e8e15b,bzip2-1.0.6.tar.gz,http://bzip.org/1.0.6/bzip2-1.0.6.tar.gz))
$(eval $(call M,2ca44be1715cd2c5666a165d35788424,c-ares-1.12.0.tar.gz,http://c-ares.haxx.se/download/c-ares-1.12.0.tar.gz))
$(eval $(call M,2bf8d1d1ee345fc8a7915576f5649982,chrpath-0.16.tar.gz,https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz))
$(eval $(call M,b8c0c7fbe0ef5e06e0c935f134304d44,clearsilver-0.10.5.tar.gz,http://www.clearsilver.net/downloads/clearsilver-0.10.5.tar.gz))
$(eval $(call M,0c3a1dcf0be03e40cf4f341dda79c96ffb6c35ae35f2f911845b72dab3559cf8,cmake-3.10.3.tar.gz,https://cmake.org/files/v3.10/cmake-3.10.3.tar.gz))
$(eval $(call M,960cfe75a42c9907c71439f8eb436303,coreutils-8.29.tar.xz,https://ftp.gnu.org/gnu/coreutils/coreutils-8.29.tar.xz))
$(eval $(call M,04c00832fa62d443b8745b056464fb30,curl-7.59.0.tar.xz,https://curl.haxx.se/download/curl-7.59.0.tar.xz))
$(eval $(call M,07cf286672ced26fba54cd0313bdc071,diffutils-3.6.tar.xz,https://ftp.gnu.org/gnu/diffutils/diffutils-3.6.tar.xz))
$(eval $(call M,5d60b2e757eceb9a52b92ceec1fb033c,libexpat-R_2_2_1.tar.gz,https://github.com/libexpat/libexpat/archive/R_2_2_1.tar.gz))
$(eval $(call M,9936aa8009438ce185bea2694a997fc1,findutils-4.6.0.tar.gz,https://ftp.gnu.org/gnu/findutils/findutils-4.6.0.tar.gz))
$(eval $(call M,2882e3179748cc9f9c23ec593d6adc8d,flex-2.6.4.tar.gz,https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz))
$(eval $(call M,b3230110e0cab777e0df7631837ac36e,freetype-2.7.1.tar.bz2,https://sourceforge.net/projects/freetype/files/freetype2/2.7.1/freetype-2.7.1.tar.bz2/download))
$(eval $(call M,4e7dbc81163e60fd4f0b52496e7542c9,gawk-4.1.4.tar.xz,https://ftp.gnu.org/gnu/gawk/gawk-4.1.4.tar.xz))
$(eval $(call M,df3f5690eaa30fd228537b00cb7b7590,gettext-0.19.8.1.tar.xz,https://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz))
$(eval $(call M,16877098823401d1bf2ed7891d7dce36,googletest-release-1.8.0.tar.gz,https://github.com/google/googletest/archive/release-1.8.0.tar.gz))
$(eval $(call M,f58fa8001d60c4c77595fbbb62b63c1d,gmp-6.1.2.tar.xz,https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz))
$(eval $(call M,aa1eaf95dbe2c9828d0bd3a00f770f50,gperftools-2.5.tar.gz,https://github.com/gperftools/gperftools/releases/download/gperftools-2.5/gperftools-2.5.tar.gz))
$(eval $(call M,feca7b3e7c7f4aab2b42ecbfc513b070,grep-3.1.tar.xz,https://ftp.gnu.org/gnu/grep/grep-3.1.tar.xz))
$(eval $(call M,212951d6e1435bb51fa4320f458809ea,gsoap_2.8.51.zip,https://sourceforge.net/projects/gsoap2/files/gsoap-2.8/gsoap_2.8.51.zip/download))
$(eval $(call M,929d6a6b832f75b28e3eeeafb30c1d9b,gzip-1.9.tar.gz,https://ftp.gnu.org/gnu/gzip/gzip-1.9.tar.gz))
$(eval $(call M,43dca1445ec6d3b702821dba36000279,hiredis-0.13.3.tar.gz,https://github.com/redis/hiredis/archive/v0.13.3.tar.gz))
$(eval $(call M,de02511859b00d17845b9abdd1f975d5ccb5d0b280c567da5bf2ad4b70846f05,httpd-2.4.33.tar.bz2,http://www-us.apache.org/dist/httpd/httpd-2.4.33.tar.bz2))
$(eval $(call M,fac212b32b7ec7ab007a12dff1f3aea1,icu4c-58_2-src.tgz,http://download.icu-project.org/files/icu4c/58.2/icu4c-58_2-src.tgz))
$(eval $(call M,6a9996ce116ec5c52b4870dbcd6d3ddb,jpeg-9b.tar.gz,http://ijg.org/files/jpegsrc.v9b.tar.gz))
$(eval $(call M,13d1991d79697df8cadbc25c93e37c83,jsoncpp-0.10.6.tar.gz,https://github.com/open-source-parsers/jsoncpp/archive/0.10.6.tar.gz))
$(eval $(call M,4583bd6b2ebf7e0e8963d90879eb1b27,libarchive-3.3.2.tar.gz,http://libarchive.org/downloads/libarchive-3.3.2.tar.gz))
$(eval $(call M,94459a5a22db041dec6f98424d6efe54,libev-4.24.tar.gz,http://dist.schmorp.de/libev/libev-4.24.tar.gz))
$(eval $(call M,f3eeaed018542963b7d2416ef1135ecc,libevent-2.1.8-stable.tar.gz,https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz))
$(eval $(call M,32f09f98ad52e11177d2400716749b9f,libfcgi-2.4.0.orig.tar.gz,http://http.debian.net/debian/pool/main/libf/libfcgi/libfcgi_2.4.0.orig.tar.gz))
$(eval $(call M,2c63c5ce5d24c5b197c03cba56c52f44,libhugetlbfs-2.20.tar.gz,https://github.com/libhugetlbfs/libhugetlbfs/releases/download/2.20/libhugetlbfs-2.20.tar.gz))
$(eval $(call M,ace8b5f2db42f7b3b3057585e80d9808,libiconv-1.15.tar.gz,https://ftp.gnu.org/gnu/libiconv/libiconv-1.15.tar.gz))
$(eval $(call M,c4f491dd411a09e9de3b8702ea6f73eb,libmcrypt-2.5.8.tar.bz2,https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.bz2/download))
$(eval $(call M,b3958716b4e53ddc5992e6c49d97e819,libmemcached-1.0.18.tar.gz,https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz))
$(eval $(call M,c05b6ca7190a5e387b78657dbe5536b2,libpng-1.6.34.tar.xz,https://sourceforge.net/projects/libpng/files/libpng16/1.6.34/libpng-1.6.34.tar.xz/download))
$(eval $(call M,1bfb9b923f2c1339b4d2ce1807064aa5,libtool-2.4.6.tar.xz,https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz))
$(eval $(call M,b786e353e2aa1b872d70d5d1ca0c740d,libxml2-2.9.8.tar.gz,ftp://xmlsoft.org/libxml2/libxml2-2.9.8.tar.gz))
$(eval $(call M,1fc72f98e98bf4443f1651165f3aa146,libxslt-1.1.32.tar.gz,ftp://xmlsoft.org/libxml2/libxslt-1.1.32.tar.gz))
$(eval $(call M,923e753825405280aebcc4e73b4b2b55,logrotate-3.12.2.tar.xz,https://github.com/logrotate/logrotate/releases/download/3.12.2/logrotate-3.12.2.tar.xz))
$(eval $(call M,730bb15d96fffe47e148d1e09235af82,m4-1.4.18.tar.xz,https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz))
$(eval $(call M,15b012617e7c44c0ed482721629577ac,make-4.2.1.tar.bz2,https://ftp.gnu.org/gnu/make/make-4.2.1.tar.bz2))
$(eval $(call M,12b618edad9bcb4b421474a2442485fd,memcached-1.4.39.tar.gz,http://www.memcached.org/files/memcached-1.4.39.tar.gz))
$(eval $(call M,001341afeded3724c19a740148737444,memcached-3.0.3.tgz,https://pecl.php.net/get/memcached-3.0.3.tgz))
$(eval $(call M,262a8c59bceee5fcb669dd92a85c637d,mod_fcgid-2.3.9.tar.bz2,http://www-us.apache.org/dist/httpd/mod_fcgid/mod_fcgid-2.3.9.tar.bz2))
$(eval $(call M,d6a1d5f8ddea3abd2cc3e98f58352d26,mpc-1.0.3.tar.gz,https://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz))
$(eval $(call M,51bfdbf81553966c8d43808122cc81b3,mpfr-3.1.6.tar.xz,https://ftp.gnu.org/gnu/mpfr/mpfr-3.1.6.tar.xz))
$(eval $(call M,5ded941ffeeec895022b97e58b1b204b,mysql++-3.2.3.tar.gz,https://tangentsoft.com/mysqlpp/releases/mysql++-3.2.3.tar.gz))
$(eval $(call M,e26523b174bdc3fd0fde6f36791ce17e,mysql-5.7.21.tar.gz,http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.21.tar.gz))
$(eval $(call M,db3fa9c199ad159519074c89f1c0243c,mysql-connector-c++-1.1.8.tar.gz,http://dev.mysql.com/get/Downloads/Connector-C++/mysql-connector-c++-1.1.8.tar.gz))
$(eval $(call M,98c889aaf8d23910d2b92d65be2e737a,ncurses-6.1.tar.gz,https://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz))
$(eval $(call M,64b864e1b0765bc876ea83afe63b6e8e,nghttp2-1.31.0.tar.xz,https://github.com/nghttp2/nghttp2/releases/download/v1.31.0/nghttp2-1.31.0.tar.xz))
$(eval $(call M,4d2fc76211435f029271f1cf6d7eeae3,nginx-1.12.2.tar.gz,http://nginx.org/download/nginx-1.12.2.tar.gz))
$(eval $(call M,ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8089e4d,openssl-1.0.2o.tar.gz,https://www.openssl.org/source/openssl-1.0.2o.tar.gz))
$(eval $(call M,78ad9937e4caadcba1526ef1853730d5,patch-2.7.6.tar.xz,https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz))
$(eval $(call M,41a842bf7dcecd6634219336e2167d1d,pcre-8.40.tar.bz2,https://sourceforge.net/projects/pcre/files/pcre/8.40/pcre-8.40.tar.bz2/download))
$(eval $(call M,e738ffce2c30bc0e84be9446af86bef0a0607d321f1a3d04bbfe2402fb5f6de0,php-7.0.28.tar.xz,http://php.net/get/php-7.0.28.tar.xz/from/this/mirror))
$(eval $(call M,f6e931e319531b736fadc017f470e68a,pkg-config-0.29.2.tar.gz,http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz))
$(eval $(call M,3743beefa3dd6247a73f8f7a32c14c33,popt-1.16.tar.gz,http://rpm5.org/files/popt/popt-1.16.tar.gz))
$(eval $(call M,31b19dcfd6567095fdb66a8c07347222,protobuf-3.4.1.tar.gz,https://github.com/google/protobuf/archive/v3.4.1.tar.gz))
$(eval $(call M,205b03a87fc83dab653b628c59b9fc91,readline-7.0.tar.gz,https://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz))
$(eval $(call M,e0c583d4c380059abd818cd540fe6938,sed-4.4.tar.xz,https://ftp.gnu.org/gnu/sed/sed-4.4.tar.xz))
$(eval $(call M,2fb24ec12001926d5209d2da90d252b9825366ac,sqlite-autoconf-3220000.tar.gz,https://www.sqlite.org/2018/sqlite-autoconf-3220000.tar.gz))
$(eval $(call M,a1802fec550baaeecff6c381629653ef,tar-1.29.tar.xz,https://ftp.gnu.org/gnu/tar/tar-1.29.tar.xz))
$(eval $(call M,88d667a8ae870d5adeca8cb7d6795442,thrift-0.9.3.tar.gz,http://www-us.apache.org/dist/thrift/0.9.3/thrift-0.9.3.tar.gz))
$(eval $(call M,62b490407489521db863b523a7f86375,unzip60.tar.gz,https://sourceforge.net/projects/infozip/files/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz/download))
$(eval $(call M,54ba880f1d66782c2287ee2c898520e9,util-linux-2.21.2.tar.xz,https://www.kernel.org/pub/linux/utils/util-linux/v2.21/util-linux-2.21.2.tar.xz))
$(eval $(call M,1695511daf585fcaf7816a401a6216f6,uuid-1.0.4.tgz,https://pecl.php.net/get/uuid-1.0.4.tgz))
$(eval $(call M,097ff1a324ae02e0a3b0369f07a7544a,which-2.21.tar.gz,https://ftp.gnu.org/gnu/which/which-2.21.tar.gz))
$(eval $(call M,1592e7ca3eece099b03b35f4d9179e7c,xz-5.2.3.tar.bz2,https://tukaani.org/xz/xz-5.2.3.tar.bz2))
$(eval $(call M,85adef240c5f370b308da8c938951a68,zlib-1.2.11.tar.xz,https://sourceforge.net/projects/libpng/files/zlib/1.2.11/zlib-1.2.11.tar.xz/download))
$(eval $(call M,55aec6196ed9fa4c451cb5ae4a1f42d8,zookeeper-3.4.11.tar.gz,http://www-us.apache.org/dist/zookeeper/zookeeper-3.4.11/zookeeper-3.4.11.tar.gz))
