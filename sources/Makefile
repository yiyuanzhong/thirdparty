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

$(eval $(call M,fcb4a8214419121bfae1b1288fe6697f,apcu-5.1.5.tgz,https://pecl.php.net/get/apcu-5.1.5.tgz))
$(eval $(call M,4e9769f3349fe11fc0a5e1b224c236aa,apr-1.5.2.tar.bz2,http://mirrors.cnnic.cn/apache/apr/apr-1.5.2.tar.bz2))
$(eval $(call M,2202b18f269ad606d70e1864857ed93c,apr-util-1.5.4.tar.bz2,http://mirrors.cnnic.cn/apache/apr/apr-util-1.5.4.tar.bz2))
$(eval $(call M,50f97f4159805e374639a73e2636f22e,autoconf-2.69.tar.xz,https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz))
$(eval $(call M,9a1ddb0e053474d9d1105cfe39b0c48d,automake-1.15.tar.xz,https://ftp.gnu.org/gnu/automake/automake-1.15.tar.xz))
$(eval $(call M,c342201de104cc9ce0a21e0ad10d4021,bison-3.0.4.tar.xz,https://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.xz))
$(eval $(call M,6aa9a5c6a4ca1016edd0ed1178e3cb87,boost_1_59_0.tar.bz2,https://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.bz2/download))
$(eval $(call M,00b516f4704d4a7cb50a1d97e6e8e15b,bzip2-1.0.6.tar.gz,http://bzip.org/1.0.6/bzip2-1.0.6.tar.gz))
$(eval $(call M,d5c6d522cfc54bb6f215a0b7912d46be,c-ares-1.11.0.tar.gz,http://c-ares.haxx.se/download/c-ares-1.11.0.tar.gz))
$(eval $(call M,2bf8d1d1ee345fc8a7915576f5649982,chrpath-0.16.tar.gz,https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz))
$(eval $(call M,b8c0c7fbe0ef5e06e0c935f134304d44,clearsilver-0.10.5.tar.gz,http://www.clearsilver.net/downloads/clearsilver-0.10.5.tar.gz))
$(eval $(call M,d6dd661380adacdb12f41b926ec99545,cmake-3.6.1.tar.gz,https://cmake.org/files/v3.6/cmake-3.6.1.tar.gz))
$(eval $(call M,070e43ba7f618d747414ef56ab248a48,coreutils-8.25.tar.xz,https://ftp.gnu.org/gnu/coreutils/coreutils-8.25.tar.xz))
$(eval $(call M,01ac668b9f78266d72bdb86aa9db0849,curl-7.50.1.tar.lzma,http://curl.haxx.se/download/curl-7.50.1.tar.lzma))
$(eval $(call M,df9ca465f30307cffd03da176a43a5d4,diffutils-3.4.tar.xz,https://ftp.gnu.org/gnu/diffutils/diffutils-3.4.tar.xz))
$(eval $(call M,9936aa8009438ce185bea2694a997fc1,findutils-4.6.0.tar.gz,https://ftp.gnu.org/gnu/findutils/findutils-4.6.0.tar.gz))
$(eval $(call M,3cbbfa1554d0b75fad9f8100732454de,flex-2.6.0.tar.xz,https://sourceforge.net/projects/flex/files/flex-2.6.0.tar.xz/download))
$(eval $(call M,6a386964e18ba28cb93370e57a19031b,freetype-2.6.5.tar.bz2,https://sourceforge.net/projects/freetype/files/freetype2/2.6.5/freetype-2.6.5.tar.bz2/download))
$(eval $(call M,97f8f44149ea9b9e94be97f68988be87,gawk-4.1.3.tar.xz,https://ftp.gnu.org/gnu/gawk/gawk-4.1.3.tar.xz))
$(eval $(call M,df3f5690eaa30fd228537b00cb7b7590,gettext-0.19.8.1.tar.xz,https://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz))
$(eval $(call M,073b984d8798ea1594f5e44d85b20d66,gmock-1.7.0.zip,https://googlemock.googlecode.com/files/gmock-1.7.0.zip))
$(eval $(call M,e70e183609244a332d80529e7e155a35,gmp-6.1.1.tar.xz,https://gmplib.org/download/gmp/gmp-6.1.1.tar.xz))
$(eval $(call M,aa1eaf95dbe2c9828d0bd3a00f770f50,gperftools-2.5.tar.gz,https://github.com/gperftools/gperftools/releases/download/gperftools-2.5/gperftools-2.5.tar.gz))
$(eval $(call M,04e96b0e6f0fe6a180ae62c88fcd0af6,grep-2.25.tar.xz,https://ftp.gnu.org/gnu/grep/grep-2.25.tar.xz))
$(eval $(call M,abc4cd7a3b3c042cf2eeb7c0d791bad5,gsoap_2.8.34.zip,https://sourceforge.net/projects/gsoap2/files/gSOAP/gsoap_2.8.34.zip/download))
$(eval $(call M,732553152814b22dc35aa0267df5286c,gzip-1.8.tar.gz,https://ftp.gnu.org/gnu/gzip/gzip-1.8.tar.gz))
$(eval $(call M,43dca1445ec6d3b702821dba36000279,hiredis-0.13.3.tar.gz,https://github.com/redis/hiredis/archive/v0.13.3.tar.gz))
$(eval $(call M,04f19c60e810c028f5240a062668a688,httpd-2.4.23.tar.bz2,http://mirrors.cnnic.cn/apache/httpd/httpd-2.4.23.tar.bz2))
$(eval $(call M,976734806026a4ef8bdd17937c8898b9,icu4c-57_1-src.tgz,http://download.icu-project.org/files/icu4c/57.1/icu4c-57_1-src.tgz))
$(eval $(call M,6a9996ce116ec5c52b4870dbcd6d3ddb,jpeg-9b.tar.gz,http://ijg.org/files/jpegsrc.v9b.tar.gz))
$(eval $(call M,13d1991d79697df8cadbc25c93e37c83,jsoncpp-0.10.6.tar.gz,https://github.com/open-source-parsers/jsoncpp/archive/0.10.6.tar.gz))
$(eval $(call M,afa257047d1941a565216edbf0171e72,libarchive-3.2.1.tar.gz,http://libarchive.org/downloads/libarchive-3.2.1.tar.gz))
$(eval $(call M,bf0007e37240103d3c2be80ca9bee3f9,libev-4.22.tar.gz,http://dist.schmorp.de/libev/libev-4.22.tar.gz))
$(eval $(call M,c4c56f986aa985677ca1db89630a2e11,libevent-2.0.22-stable.tar.gz,https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz))
$(eval $(call M,32f09f98ad52e11177d2400716749b9f,libfcgi-2.4.0.orig.tar.gz,http://http.debian.net/debian/pool/main/libf/libfcgi/libfcgi_2.4.0.orig.tar.gz))
$(eval $(call M,2c63c5ce5d24c5b197c03cba56c52f44,libhugetlbfs-2.20.tar.gz,https://github.com/libhugetlbfs/libhugetlbfs/releases/download/2.20/libhugetlbfs-2.20.tar.gz))
$(eval $(call M,e34509b1623cec449dfeb73d7ce9c6c6,libiconv-1.14.tar.gz,https://ftp.gnu.org/gnu/libiconv/libiconv-1.14.tar.gz))
$(eval $(call M,c4f491dd411a09e9de3b8702ea6f73eb,libmcrypt-2.5.8.tar.bz2,https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.bz2/download))
$(eval $(call M,b3958716b4e53ddc5992e6c49d97e819,libmemcached-1.0.18.tar.gz,https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz))
$(eval $(call M,ffcdbd549814787fa8010c372e35ff25,libpng-1.6.24.tar.xz,https://sourceforge.net/projects/libpng/files/libpng16/1.6.24/libpng-1.6.24.tar.xz/download))
$(eval $(call M,1bfb9b923f2c1339b4d2ce1807064aa5,libtool-2.4.6.tar.xz,https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz))
$(eval $(call M,a4930f5743ce2e7b4f2a1cd898b9bdc6,libxls-1.4.0.zip,https://sourceforge.net/projects/libxls/files/libxls-1.4.0.zip/download))
$(eval $(call M,ae249165c173b1ff386ee8ad676815f5,libxml2-2.9.4.tar.gz,ftp://xmlsoft.org/libxml2/libxml2-2.9.4.tar.gz))
$(eval $(call M,a129d3c44c022de3b9dcf6d6f288d72e,libxslt-1.1.29.tar.gz,ftp://xmlsoft.org/libxml2/libxslt-1.1.29.tar.gz))
$(eval $(call M,4492b145b6d542e4a2f41e77fa199ab0,logrotate-3.9.1.tar.gz,https://fedorahosted.org/releases/l/o/logrotate/logrotate-3.9.1.tar.gz))
$(eval $(call M,12a3c829301a4fd6586a57d3fcf196dc,m4-1.4.17.tar.xz,https://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.xz))
$(eval $(call M,15b012617e7c44c0ed482721629577ac,make-4.2.1.tar.bz2,https://ftp.gnu.org/gnu/make/make-4.2.1.tar.bz2))
$(eval $(call M,0c10a189210df7c3339dbff6c2f9c5f6,memcached-1.4.30.tar.gz,http://www.memcached.org/files/memcached-1.4.30.tar.gz))
$(eval $(call M,751535b85f68409736c09f496fe59cfc,php-memcached-583ecd68faec886ac9233277531f78fb6e2043c7.zip,https://github.com/php-memcached-dev/php-memcached/archive/583ecd68faec886ac9233277531f78fb6e2043c7.zip))
$(eval $(call M,262a8c59bceee5fcb669dd92a85c637d,mod_fcgid-2.3.9.tar.bz2,http://mirrors.cnnic.cn/apache/httpd/mod_fcgid/mod_fcgid-2.3.9.tar.bz2))
$(eval $(call M,d6a1d5f8ddea3abd2cc3e98f58352d26,mpc-1.0.3.tar.gz,https://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz))
$(eval $(call M,064b2c18185038e404a401b830d59be8,mpfr-3.1.4.tar.xz,http://www.mpfr.org/mpfr-current/mpfr-3.1.4.tar.xz))
$(eval $(call M,1397502eac7f0a9800116411e8b21187,mysql++-3.2.2.tar.gz,http://www.tangentsoft.net/mysql++/releases/mysql++-3.2.2.tar.gz))
$(eval $(call M,da66d5c2f7870018fe63341102e4d123,mysql-5.7.14.tar.gz,http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.14.tar.gz))
$(eval $(call M,4b0425811bca23c0323b97e787b7709e,mysql-connector-c++-1.1.7.tar.gz,http://dev.mysql.com/get/Downloads/Connector-C++/mysql-connector-c++-1.1.7.tar.gz))
$(eval $(call M,ee13d052e1ead260d7c28071f46eefb1,ncurses-6.0.tar.gz,https://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz))
$(eval $(call M,908f5f1b86a1ba8b142ece7129c8a954,nghttp2-1.13.0.tar.xz,https://github.com/tatsuhiro-t/nghttp2/releases/download/v1.13.0/nghttp2-1.13.0.tar.xz))
$(eval $(call M,088292d9caf6059ef328aa7dda332e44,nginx-1.10.1.tar.gz,http://nginx.org/download/nginx-1.10.1.tar.gz))
$(eval $(call M,9392e65072ce4b614c1392eefc1f23d0,openssl-1.0.2h.tar.gz,https://www.openssl.org/source/openssl-1.0.2h.tar.gz))
$(eval $(call M,e3da7940431633fb65a01b91d3b7a27a,patch-2.7.5.tar.xz,https://ftp.gnu.org/gnu/patch/patch-2.7.5.tar.xz))
$(eval $(call M,e3fca7650a0556a2647821679d81f585,pcre-8.39.tar.bz2,https://sourceforge.net/projects/pcre/files/pcre/8.39/pcre-8.39.tar.bz2/download))
$(eval $(call M,6f087f16514b6c442e8009a5828827b7,php-7.0.10.tar.xz,http://cn2.php.net/get/php-7.0.10.tar.xz/from/this/mirror))
$(eval $(call M,f739a28cae4e0ca291f82d1d41ef107d,pkg-config-0.29.1.tar.gz,http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.1.tar.gz))
$(eval $(call M,3743beefa3dd6247a73f8f7a32c14c33,popt-1.16.tar.gz,http://rpm5.org/files/popt/popt-1.16.tar.gz))
$(eval $(call M,d4f6ca65aadc6310b3872ee421e79fa6,protobuf-3.0.0.tar.gz,https://github.com/google/protobuf/archive/v3.0.0.tar.gz))
$(eval $(call M,33c8fb279e981274f485fd91da77e94a,readline-6.3.tar.gz,https://ftp.gnu.org/gnu/readline/readline-6.3.tar.gz))
$(eval $(call M,7ffe1c7cdc3233e1e0c4b502df253974,sed-4.2.2.tar.bz2,https://ftp.gnu.org/gnu/sed/sed-4.2.2.tar.bz2))
$(eval $(call M,3634a90a3f49541462bcaed3474b2684,sqlite-autoconf-3140100.tar.gz,https://www.sqlite.org/2016/sqlite-autoconf-3140100.tar.gz))
$(eval $(call M,a1802fec550baaeecff6c381629653ef,tar-1.29.tar.xz,https://ftp.gnu.org/gnu/tar/tar-1.29.tar.xz))
$(eval $(call M,88d667a8ae870d5adeca8cb7d6795442,thrift-0.9.3.tar.gz,http://mirrors.cnnic.cn/apache/thrift/0.9.3/thrift-0.9.3.tar.gz))
$(eval $(call M,c1b864c96804a10526540c664ade67f0,tinyxml_2_6_2.tar.gz,https://sourceforge.net/projects/tinyxml/files/tinyxml/2.6.2/tinyxml_2_6_2.tar.gz/download))
$(eval $(call M,62b490407489521db863b523a7f86375,unzip60.tar.gz,https://sourceforge.net/projects/infozip/files/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz/download))
$(eval $(call M,54ba880f1d66782c2287ee2c898520e9,util-linux-2.21.2.tar.xz,https://www.kernel.org/pub/linux/utils/util-linux/v2.21/util-linux-2.21.2.tar.xz))
$(eval $(call M,1695511daf585fcaf7816a401a6216f6,uuid-1.0.4.tgz,https://pecl.php.net/get/uuid-1.0.4.tgz))
$(eval $(call M,097ff1a324ae02e0a3b0369f07a7544a,which-2.21.tar.gz,https://ftp.gnu.org/gnu/which/which-2.21.tar.gz))
$(eval $(call M,567336ebee41552195c4035c87b9361b,xlslib-package-2.5.0.zip,https://sourceforge.net/projects/xlslib/files/xlslib-package-2.5.0.zip/download))
$(eval $(call M,f90c9a0c8b259aee2234c4e0d7fd70af,xz-5.2.2.tar.bz2,http://tukaani.org/xz/xz-5.2.2.tar.bz2))
$(eval $(call M,44d667c142d7cda120332623eab69f40,zlib-1.2.8.tar.gz,http://zlib.net/zlib-1.2.8.tar.gz))
$(eval $(call M,6bdddcd5179e9c259ef2bf4be2158d18,zookeeper-3.4.8.tar.gz,http://mirrors.cnnic.cn/apache/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz))
