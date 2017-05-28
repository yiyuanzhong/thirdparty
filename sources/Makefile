CURL = curl --connect-timeout 10 --ftp-pasv --retry 3 --retry-delay 1 -L --max-redirs 3 --insecure --silent --show-error
MD5SUM = (md5sum -b | awk '{print $$1; F=1}END{exit !F}' || md5 || openssl md5) 2>/dev/null
FALSE = false
ECHO = echo
RM = rm -fv
MV = mv -f
AWK = awk
CAT = cat

all:
check:

AT :=
V := 0
ifeq ($(V),0)
AT := @
endif

define M
.PHONY: check/$(2)
check: check/$(2)
all: $(2)
$(2):
	$(AT)$$(ECHO) 'Downloading $(2)'
	$(AT)$$(CURL) -o $(2).dl '$(3)' || ($$(RM) $(2).dl; $$(FALSE))
	$(AT)$$(ECHO) 'Checking $(2)'
	$(AT)test x`$$(CAT) '$(2).dl' | $$(MD5SUM) | $$(AWK) '{ print $$$$NF }'` = x'$(1)'
	$(AT)$$(MV) $(2).dl $(2)
check/$(2):
	$(AT)$$(ECHO) 'Checking $(2)'
	$(AT)if [ `$$(CAT) '$(2)' | $$(MD5SUM) | $$(AWK) '{ print $$$$NF }'` != '$(1)' ]; then $$(RM) '$(2)'; $$(FALSE); fi
endef

$(eval $(call M,0ef8be2ee8acb4dba5a66b247a254995,apcu-5.1.8.tgz,https://pecl.php.net/get/apcu-5.1.8.tgz))
$(eval $(call M,4e9769f3349fe11fc0a5e1b224c236aa,apr-1.5.2.tar.bz2,http://www-us.apache.org/dist/apr/apr-1.5.2.tar.bz2))
$(eval $(call M,2202b18f269ad606d70e1864857ed93c,apr-util-1.5.4.tar.bz2,http://www-us.apache.org/dist/apr/apr-util-1.5.4.tar.bz2))
$(eval $(call M,50f97f4159805e374639a73e2636f22e,autoconf-2.69.tar.xz,https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz))
$(eval $(call M,9a1ddb0e053474d9d1105cfe39b0c48d,automake-1.15.tar.xz,https://ftp.gnu.org/gnu/automake/automake-1.15.tar.xz))
$(eval $(call M,c342201de104cc9ce0a21e0ad10d4021,bison-3.0.4.tar.xz,https://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.xz))
$(eval $(call M,6aa9a5c6a4ca1016edd0ed1178e3cb87,boost_1_59_0.tar.bz2,https://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.bz2/download))
$(eval $(call M,00b516f4704d4a7cb50a1d97e6e8e15b,bzip2-1.0.6.tar.gz,http://bzip.org/1.0.6/bzip2-1.0.6.tar.gz))
$(eval $(call M,2ca44be1715cd2c5666a165d35788424,c-ares-1.12.0.tar.gz,http://c-ares.haxx.se/download/c-ares-1.12.0.tar.gz))
$(eval $(call M,2bf8d1d1ee345fc8a7915576f5649982,chrpath-0.16.tar.gz,https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz))
$(eval $(call M,b8c0c7fbe0ef5e06e0c935f134304d44,clearsilver-0.10.5.tar.gz,http://www.clearsilver.net/downloads/clearsilver-0.10.5.tar.gz))
$(eval $(call M,79bd7e65cd81ea3aa2619484ad6ff25a,cmake-3.7.2.tar.gz,https://cmake.org/files/v3.7/cmake-3.7.2.tar.gz))
$(eval $(call M,d5aa2072f662d4118b9f4c63b94601a6,coreutils-8.26.tar.xz,https://ftp.gnu.org/gnu/coreutils/coreutils-8.26.tar.xz))
$(eval $(call M,78fce113c34e7a7941080bcd0d21fecc,curl-7.53.1.tar.lzma,http://curl.haxx.se/download/curl-7.53.1.tar.lzma))
$(eval $(call M,569354697ff1cfc9a9de3781361015fa,diffutils-3.5.tar.xz,https://ftp.gnu.org/gnu/diffutils/diffutils-3.5.tar.xz))
$(eval $(call M,9936aa8009438ce185bea2694a997fc1,findutils-4.6.0.tar.gz,https://ftp.gnu.org/gnu/findutils/findutils-4.6.0.tar.gz))
$(eval $(call M,a5f65570cd9107ec8a8ec88f17b31bb1,flex-2.6.3.tar.gz,https://github.com/westes/flex/releases/download/v2.6.3/flex-2.6.3.tar.gz))
$(eval $(call M,b3230110e0cab777e0df7631837ac36e,freetype-2.7.1.tar.bz2,https://sourceforge.net/projects/freetype/files/freetype2/2.7.1/freetype-2.7.1.tar.bz2/download))
$(eval $(call M,4e7dbc81163e60fd4f0b52496e7542c9,gawk-4.1.4.tar.xz,https://ftp.gnu.org/gnu/gawk/gawk-4.1.4.tar.xz))
$(eval $(call M,df3f5690eaa30fd228537b00cb7b7590,gettext-0.19.8.1.tar.xz,https://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz))
$(eval $(call M,16877098823401d1bf2ed7891d7dce36,googletest-release-1.8.0.tar.gz,https://github.com/google/googletest/archive/release-1.8.0.tar.gz))
$(eval $(call M,f58fa8001d60c4c77595fbbb62b63c1d,gmp-6.1.2.tar.xz,https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz))
$(eval $(call M,aa1eaf95dbe2c9828d0bd3a00f770f50,gperftools-2.5.tar.gz,https://github.com/gperftools/gperftools/releases/download/gperftools-2.5/gperftools-2.5.tar.gz))
$(eval $(call M,6138dd227c39d4a25f81eea76a44d4cb,grep-2.27.tar.xz,https://ftp.gnu.org/gnu/grep/grep-2.27.tar.xz))
$(eval $(call M,9117fbd45319cd1e64bd024f383fabbe,gsoap_2.8.44.zip,https://sourceforge.net/projects/gsoap2/files/gsoap-2.8/gsoap_2.8.44.zip/download))
$(eval $(call M,732553152814b22dc35aa0267df5286c,gzip-1.8.tar.gz,https://ftp.gnu.org/gnu/gzip/gzip-1.8.tar.gz))
$(eval $(call M,43dca1445ec6d3b702821dba36000279,hiredis-0.13.3.tar.gz,https://github.com/redis/hiredis/archive/v0.13.3.tar.gz))
$(eval $(call M,2826f49619112ad5813c0be5afcc7ddb,httpd-2.4.25.tar.bz2,http://www-us.apache.org/dist/httpd/httpd-2.4.25.tar.bz2))
$(eval $(call M,fac212b32b7ec7ab007a12dff1f3aea1,icu4c-58_2-src.tgz,http://download.icu-project.org/files/icu4c/58.2/icu4c-58_2-src.tgz))
$(eval $(call M,6a9996ce116ec5c52b4870dbcd6d3ddb,jpeg-9b.tar.gz,http://ijg.org/files/jpegsrc.v9b.tar.gz))
$(eval $(call M,13d1991d79697df8cadbc25c93e37c83,jsoncpp-0.10.6.tar.gz,https://github.com/open-source-parsers/jsoncpp/archive/0.10.6.tar.gz))
$(eval $(call M,1ec00b7dcaf969dd2a5712f85f23c764,libarchive-3.2.2.tar.gz,http://libarchive.org/downloads/libarchive-3.2.2.tar.gz))
$(eval $(call M,94459a5a22db041dec6f98424d6efe54,libev-4.24.tar.gz,http://dist.schmorp.de/libev/libev-4.24.tar.gz))
$(eval $(call M,c4c56f986aa985677ca1db89630a2e11,libevent-2.0.22-stable.tar.gz,https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz))
$(eval $(call M,32f09f98ad52e11177d2400716749b9f,libfcgi-2.4.0.orig.tar.gz,http://http.debian.net/debian/pool/main/libf/libfcgi/libfcgi_2.4.0.orig.tar.gz))
$(eval $(call M,2c63c5ce5d24c5b197c03cba56c52f44,libhugetlbfs-2.20.tar.gz,https://github.com/libhugetlbfs/libhugetlbfs/releases/download/2.20/libhugetlbfs-2.20.tar.gz))
$(eval $(call M,e34509b1623cec449dfeb73d7ce9c6c6,libiconv-1.14.tar.gz,https://ftp.gnu.org/gnu/libiconv/libiconv-1.14.tar.gz))
$(eval $(call M,c4f491dd411a09e9de3b8702ea6f73eb,libmcrypt-2.5.8.tar.bz2,https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.bz2/download))
$(eval $(call M,b3958716b4e53ddc5992e6c49d97e819,libmemcached-1.0.18.tar.gz,https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz))
$(eval $(call M,425354f86c392318d31aedca71019372,libpng-1.6.28.tar.xz,https://sourceforge.net/projects/libpng/files/libpng16/1.6.28/libpng-1.6.28.tar.xz/download))
$(eval $(call M,1bfb9b923f2c1339b4d2ce1807064aa5,libtool-2.4.6.tar.xz,https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz))
$(eval $(call M,ae249165c173b1ff386ee8ad676815f5,libxml2-2.9.4.tar.gz,ftp://xmlsoft.org/libxml2/libxml2-2.9.4.tar.gz))
$(eval $(call M,a129d3c44c022de3b9dcf6d6f288d72e,libxslt-1.1.29.tar.gz,ftp://xmlsoft.org/libxml2/libxslt-1.1.29.tar.gz))
$(eval $(call M,10dd0623130e0c3908e849315cbd2415,logrotate-3.9.2.tar.xz,https://github.com/logrotate/logrotate/releases/download/3.9.2/logrotate-3.9.2.tar.xz))
$(eval $(call M,730bb15d96fffe47e148d1e09235af82,m4-1.4.18.tar.xz,https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz))
$(eval $(call M,15b012617e7c44c0ed482721629577ac,make-4.2.1.tar.bz2,https://ftp.gnu.org/gnu/make/make-4.2.1.tar.bz2))
$(eval $(call M,1e028fbab7288911fcaa5ed2a21817fe,memcached-1.4.36.tar.gz,http://www.memcached.org/files/memcached-1.4.36.tar.gz))
$(eval $(call M,8f62d75035e3a23cfedd327ce659898d,php-memcached-e65be324557eda7167c4831b4bfb1ad23a152beb.zip,https://github.com/php-memcached-dev/php-memcached/archive/e65be324557eda7167c4831b4bfb1ad23a152beb.zip))
$(eval $(call M,262a8c59bceee5fcb669dd92a85c637d,mod_fcgid-2.3.9.tar.bz2,http://www-us.apache.org/dist/httpd/mod_fcgid/mod_fcgid-2.3.9.tar.bz2))
$(eval $(call M,d6a1d5f8ddea3abd2cc3e98f58352d26,mpc-1.0.3.tar.gz,https://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz))
$(eval $(call M,c4ac246cf9795a4491e7766002cd528f,mpfr-3.1.5.tar.xz,http://www.mpfr.org/mpfr-3.1.5/mpfr-3.1.5.tar.xz))
$(eval $(call M,5ded941ffeeec895022b97e58b1b204b,mysql++-3.2.3.tar.gz,http://www.tangentsoft.net/mysql++/releases/mysql++-3.2.3.tar.gz))
$(eval $(call M,db2a87ede6132b226f8d43d3ac349284,mysql-5.7.17.tar.gz,http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.17.tar.gz))
$(eval $(call M,db3fa9c199ad159519074c89f1c0243c,mysql-connector-c++-1.1.8.tar.gz,http://dev.mysql.com/get/Downloads/Connector-C++/mysql-connector-c++-1.1.8.tar.gz))
$(eval $(call M,ee13d052e1ead260d7c28071f46eefb1,ncurses-6.0.tar.gz,https://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz))
$(eval $(call M,8d5cd7090d58692e7156c67955694003,nghttp2-1.21.0.tar.xz,https://github.com/nghttp2/nghttp2/releases/download/v1.21.0/nghttp2-1.21.0.tar.xz))
$(eval $(call M,995eb0a140455cf0cfc497e5bd7f94b3,nginx-1.12.0.tar.gz,http://nginx.org/download/nginx-1.12.0.tar.gz))
$(eval $(call M,f965fc0bf01bf882b31314b61391ae65,openssl-1.0.2k.tar.gz,https://www.openssl.org/source/openssl-1.0.2k.tar.gz))
$(eval $(call M,e3da7940431633fb65a01b91d3b7a27a,patch-2.7.5.tar.xz,https://ftp.gnu.org/gnu/patch/patch-2.7.5.tar.xz))
$(eval $(call M,41a842bf7dcecd6634219336e2167d1d,pcre-8.40.tar.bz2,https://sourceforge.net/projects/pcre/files/pcre/8.40/pcre-8.40.tar.bz2/download))
$(eval $(call M,1a17e45c8be9ce28f036d884563e8ae7,php-7.0.19.tar.xz,http://php.net/get/php-7.0.19.tar.xz/from/this/mirror))
$(eval $(call M,f739a28cae4e0ca291f82d1d41ef107d,pkg-config-0.29.1.tar.gz,http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.1.tar.gz))
$(eval $(call M,3743beefa3dd6247a73f8f7a32c14c33,popt-1.16.tar.gz,http://rpm5.org/files/popt/popt-1.16.tar.gz))
$(eval $(call M,10644296984c7cbdd1e8436e88b069d2,protobuf-3.3.0.tar.gz,https://github.com/google/protobuf/archive/v3.3.0.tar.gz))
$(eval $(call M,205b03a87fc83dab653b628c59b9fc91,readline-7.0.tar.gz,https://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz))
$(eval $(call M,7ffe1c7cdc3233e1e0c4b502df253974,sed-4.2.2.tar.bz2,https://ftp.gnu.org/gnu/sed/sed-4.2.2.tar.bz2))
$(eval $(call M,5a153ef1fd2fa5845ada74deabc68e32,sqlite-autoconf-3160200.tar.gz,https://www.sqlite.org/2017/sqlite-autoconf-3160200.tar.gz))
$(eval $(call M,a1802fec550baaeecff6c381629653ef,tar-1.29.tar.xz,https://ftp.gnu.org/gnu/tar/tar-1.29.tar.xz))
$(eval $(call M,88d667a8ae870d5adeca8cb7d6795442,thrift-0.9.3.tar.gz,http://www-us.apache.org/dist/thrift/0.9.3/thrift-0.9.3.tar.gz))
$(eval $(call M,62b490407489521db863b523a7f86375,unzip60.tar.gz,https://sourceforge.net/projects/infozip/files/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz/download))
$(eval $(call M,54ba880f1d66782c2287ee2c898520e9,util-linux-2.21.2.tar.xz,https://www.kernel.org/pub/linux/utils/util-linux/v2.21/util-linux-2.21.2.tar.xz))
$(eval $(call M,1695511daf585fcaf7816a401a6216f6,uuid-1.0.4.tgz,https://pecl.php.net/get/uuid-1.0.4.tgz))
$(eval $(call M,097ff1a324ae02e0a3b0369f07a7544a,which-2.21.tar.gz,https://ftp.gnu.org/gnu/which/which-2.21.tar.gz))
$(eval $(call M,1592e7ca3eece099b03b35f4d9179e7c,xz-5.2.3.tar.bz2,http://tukaani.org/xz/xz-5.2.3.tar.bz2))
$(eval $(call M,28f1205d8dd2001f26fec1e8c2cebe37,zlib-1.2.8.tar.xz,https://sourceforge.net/projects/libpng/files/zlib/1.2.8/zlib-1.2.8.tar.xz/download))
$(eval $(call M,e4cf1b1593ca870bf1c7a75188f09678,zookeeper-3.4.10.tar.gz,http://www-us.apache.org/dist/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz))
