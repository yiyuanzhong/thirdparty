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

$(eval $(call M,af23ab91d9d1de142c940dbf2b2398df,apcu-5.1.4.tgz,https://pecl.php.net/get/apcu-5.1.4.tgz))
$(eval $(call M,4e9769f3349fe11fc0a5e1b224c236aa,apr-1.5.2.tar.bz2,http://mirrors.cnnic.cn/apache/apr/apr-1.5.2.tar.bz2))
$(eval $(call M,2202b18f269ad606d70e1864857ed93c,apr-util-1.5.4.tar.bz2,http://mirrors.cnnic.cn/apache/apr/apr-util-1.5.4.tar.bz2))
$(eval $(call M,50f97f4159805e374639a73e2636f22e,autoconf-2.69.tar.xz,https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz))
$(eval $(call M,9a1ddb0e053474d9d1105cfe39b0c48d,automake-1.15.tar.xz,https://ftp.gnu.org/gnu/automake/automake-1.15.tar.xz))
$(eval $(call M,c342201de104cc9ce0a21e0ad10d4021,bison-3.0.4.tar.xz,https://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.xz))
$(eval $(call M,6aa9a5c6a4ca1016edd0ed1178e3cb87,boost_1_59_0.tar.bz2,https://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.bz2/download))
$(eval $(call M,00b516f4704d4a7cb50a1d97e6e8e15b,bzip2-1.0.6.tar.gz,http://bzip.org/1.0.6/bzip2-1.0.6.tar.gz))
$(eval $(call M,1196067641411a75d3cbebe074fd36d8,c-ares-1.10.0.tar.gz,http://c-ares.haxx.se/download/c-ares-1.10.0.tar.gz))
$(eval $(call M,2bf8d1d1ee345fc8a7915576f5649982,chrpath-0.16.tar.gz,https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz))
$(eval $(call M,b8c0c7fbe0ef5e06e0c935f134304d44,clearsilver-0.10.5.tar.gz,http://www.clearsilver.net/downloads/clearsilver-0.10.5.tar.gz))
$(eval $(call M,701386a1b5ec95f8d1075ecf96383e02,cmake-3.5.2.tar.gz,https://cmake.org/files/v3.5/cmake-3.5.2.tar.gz))
$(eval $(call M,070e43ba7f618d747414ef56ab248a48,coreutils-8.25.tar.xz,https://ftp.gnu.org/gnu/coreutils/coreutils-8.25.tar.xz))
$(eval $(call M,ae5e5e395da413d1fa0864e1d0a3fa57,curl-7.49.1.tar.lzma,http://curl.haxx.se/download/curl-7.49.1.tar.lzma))
$(eval $(call M,99180208ec2a82ce71f55b0d7389f1b3,diffutils-3.3.tar.xz,https://ftp.gnu.org/gnu/diffutils/diffutils-3.3.tar.xz))
$(eval $(call M,9936aa8009438ce185bea2694a997fc1,findutils-4.6.0.tar.gz,https://ftp.gnu.org/gnu/findutils/findutils-4.6.0.tar.gz))
$(eval $(call M,3cbbfa1554d0b75fad9f8100732454de,flex-2.6.0.tar.xz,https://sourceforge.net/projects/flex/files/flex-2.6.0.tar.xz/download))
$(eval $(call M,0037b25a8c090bc8a1218e867b32beb1,freetype-2.6.3.tar.bz2,https://sourceforge.net/projects/freetype/files/freetype2/2.6.3/freetype-2.6.3.tar.bz2/download))
$(eval $(call M,97f8f44149ea9b9e94be97f68988be87,gawk-4.1.3.tar.xz,https://ftp.gnu.org/gnu/gawk/gawk-4.1.3.tar.xz))
$(eval $(call M,f81e50556da41b44c1d59ac93474dca5,gettext-0.19.7.tar.xz,https://ftp.gnu.org/gnu/gettext/gettext-0.19.7.tar.xz))
$(eval $(call M,073b984d8798ea1594f5e44d85b20d66,gmock-1.7.0.zip,https://googlemock.googlecode.com/files/gmock-1.7.0.zip))
$(eval $(call M,e70e183609244a332d80529e7e155a35,gmp-6.1.1.tar.xz,https://gmplib.org/download/gmp/gmp-6.1.1.tar.xz))
$(eval $(call M,aa1eaf95dbe2c9828d0bd3a00f770f50,gperftools-2.5.tar.gz,https://github.com/gperftools/gperftools/releases/download/gperftools-2.5/gperftools-2.5.tar.gz))
$(eval $(call M,04e96b0e6f0fe6a180ae62c88fcd0af6,grep-2.25.tar.xz,https://ftp.gnu.org/gnu/grep/grep-2.25.tar.xz))
$(eval $(call M,bf2fbf68fcddd5e860667a4ddbad4325,gsoap_2.8.27.zip,https://sourceforge.net/projects/gsoap2/files/gSOAP/gsoap_2.8.27.zip/download))
$(eval $(call M,732553152814b22dc35aa0267df5286c,gzip-1.8.tar.gz,https://ftp.gnu.org/gnu/gzip/gzip-1.8.tar.gz))
$(eval $(call M,43dca1445ec6d3b702821dba36000279,hiredis-0.13.3.tar.gz,https://github.com/redis/hiredis/archive/v0.13.3.tar.gz))
$(eval $(call M,3ff4f00ee051cf5d5304b47b1bc418b8,httpd-2.4.20.tar.bz2,http://mirrors.cnnic.cn/apache/httpd/httpd-2.4.20.tar.bz2))
$(eval $(call M,976734806026a4ef8bdd17937c8898b9,icu4c-57_1-src.tgz,http://download.icu-project.org/files/icu4c/57.1/icu4c-57_1-src.tgz))
$(eval $(call M,6a9996ce116ec5c52b4870dbcd6d3ddb,jpeg-9b.tar.gz,http://ijg.org/files/jpegsrc.v9b.tar.gz))
$(eval $(call M,13d1991d79697df8cadbc25c93e37c83,jsoncpp-0.10.6.tar.gz,https://github.com/open-source-parsers/jsoncpp/archive/0.10.6.tar.gz))
$(eval $(call M,efad5a503f66329bb9d2f4308b5de98a,libarchive-3.1.2.tar.gz,http://libarchive.org/downloads/libarchive-3.1.2.tar.gz))
$(eval $(call M,bf0007e37240103d3c2be80ca9bee3f9,libev-4.22.tar.gz,http://dist.schmorp.de/libev/libev-4.22.tar.gz))
$(eval $(call M,c4c56f986aa985677ca1db89630a2e11,libevent-2.0.22-stable.tar.gz,https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz))
$(eval $(call M,32f09f98ad52e11177d2400716749b9f,libfcgi-2.4.0.orig.tar.gz,http://http.debian.net/debian/pool/main/libf/libfcgi/libfcgi_2.4.0.orig.tar.gz))
$(eval $(call M,2c63c5ce5d24c5b197c03cba56c52f44,libhugetlbfs-2.20.tar.gz,https://github.com/libhugetlbfs/libhugetlbfs/releases/download/2.20/libhugetlbfs-2.20.tar.gz))
$(eval $(call M,e34509b1623cec449dfeb73d7ce9c6c6,libiconv-1.14.tar.gz,https://ftp.gnu.org/gnu/libiconv/libiconv-1.14.tar.gz))
$(eval $(call M,c4f491dd411a09e9de3b8702ea6f73eb,libmcrypt-2.5.8.tar.bz2,https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.bz2/download))
$(eval $(call M,b3958716b4e53ddc5992e6c49d97e819,libmemcached-1.0.18.tar.gz,https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz))
$(eval $(call M,f4ca54a3d945b8678fafed168c503f3b,libpng-1.6.22.tar.xz,https://sourceforge.net/projects/libpng/files/libpng16/1.6.22/libpng-1.6.22.tar.xz/download))
$(eval $(call M,1bfb9b923f2c1339b4d2ce1807064aa5,libtool-2.4.6.tar.xz,https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz))
$(eval $(call M,a4930f5743ce2e7b4f2a1cd898b9bdc6,libxls-1.4.0.zip,https://sourceforge.net/projects/libxls/files/libxls-1.4.0.zip/download))
$(eval $(call M,daece17e045f1c107610e137ab50c179,libxml2-2.9.3.tar.gz,ftp://xmlsoft.org/libxml2/libxml2-2.9.3.tar.gz))
$(eval $(call M,9667bf6f9310b957254fdcf6596600b7,libxslt-1.1.28.tar.gz,ftp://xmlsoft.org/libxml2/libxslt-1.1.28.tar.gz))
$(eval $(call M,4492b145b6d542e4a2f41e77fa199ab0,logrotate-3.9.1.tar.gz,https://fedorahosted.org/releases/l/o/logrotate/logrotate-3.9.1.tar.gz))
$(eval $(call M,12a3c829301a4fd6586a57d3fcf196dc,m4-1.4.17.tar.xz,https://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.xz))
$(eval $(call M,15b012617e7c44c0ed482721629577ac,make-4.2.1.tar.bz2,https://ftp.gnu.org/gnu/make/make-4.2.1.tar.bz2))
$(eval $(call M,59b7bbfbc9cde5731bf4446e1e37b440,memcached-1.4.26.tar.gz,http://www.memcached.org/files/memcached-1.4.26.tar.gz))
$(eval $(call M,9ae1f9b199b4bae2b85cdef7cb5faf22,php-memcached-6ee96cad7be5caa1f13a1f3e5a4d5f900b9c04ce.zip,https://github.com/php-memcached-dev/php-memcached/archive/6ee96cad7be5caa1f13a1f3e5a4d5f900b9c04ce.zip))
$(eval $(call M,262a8c59bceee5fcb669dd92a85c637d,mod_fcgid-2.3.9.tar.bz2,http://mirrors.cnnic.cn/apache/httpd/mod_fcgid/mod_fcgid-2.3.9.tar.bz2))
$(eval $(call M,d6a1d5f8ddea3abd2cc3e98f58352d26,mpc-1.0.3.tar.gz,https://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz))
$(eval $(call M,064b2c18185038e404a401b830d59be8,mpfr-3.1.4.tar.xz,http://www.mpfr.org/mpfr-current/mpfr-3.1.4.tar.xz))
$(eval $(call M,1397502eac7f0a9800116411e8b21187,mysql++-3.2.2.tar.gz,http://www.tangentsoft.net/mysql++/releases/mysql++-3.2.2.tar.gz))
$(eval $(call M,8fab75dbcafcd1374d07796bff88ae00,mysql-5.7.13.tar.gz,http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.13.tar.gz))
$(eval $(call M,4b0425811bca23c0323b97e787b7709e,mysql-connector-c++-1.1.7.tar.gz,http://dev.mysql.com/get/Downloads/Connector-C++/mysql-connector-c++-1.1.7.tar.gz))
$(eval $(call M,ee13d052e1ead260d7c28071f46eefb1,ncurses-6.0.tar.gz,https://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz))
$(eval $(call M,22b3a70df7a0bb3a734b2d44973f1a0c,nghttp2-1.11.1.tar.xz,https://github.com/tatsuhiro-t/nghttp2/releases/download/v1.11.1/nghttp2-1.11.1.tar.xz))
$(eval $(call M,088292d9caf6059ef328aa7dda332e44,nginx-1.10.1.tar.gz,http://nginx.org/download/nginx-1.10.1.tar.gz))
$(eval $(call M,9392e65072ce4b614c1392eefc1f23d0,openssl-1.0.2h.tar.gz,https://www.openssl.org/source/openssl-1.0.2h.tar.gz))
$(eval $(call M,e3da7940431633fb65a01b91d3b7a27a,patch-2.7.5.tar.xz,https://ftp.gnu.org/gnu/patch/patch-2.7.5.tar.xz))
$(eval $(call M,e3fca7650a0556a2647821679d81f585,pcre-8.39.tar.bz2,https://sourceforge.net/projects/pcre/files/pcre/8.39/pcre-8.39.tar.bz2/download))
$(eval $(call M,75f8d1693a470cefe2a50abd283eb291,php-7.0.7.tar.xz,http://cn2.php.net/get/php-7.0.7.tar.xz/from/this/mirror))
$(eval $(call M,aa3c86e67551adc3ac865160e34a2a0d,pkg-config-0.28.tar.gz,http://pkgconfig.freedesktop.org/releases/pkg-config-0.28.tar.gz))
$(eval $(call M,3743beefa3dd6247a73f8f7a32c14c33,popt-1.16.tar.gz,http://rpm5.org/files/popt/popt-1.16.tar.gz))
$(eval $(call M,a8360bfdb1fa8e5195341bb814fdf835,protobuf-3.0.0-beta-3.1.tar.gz,https://github.com/google/protobuf/archive/v3.0.0-beta-3.1.tar.gz))
$(eval $(call M,33c8fb279e981274f485fd91da77e94a,readline-6.3.tar.gz,https://ftp.gnu.org/gnu/readline/readline-6.3.tar.gz))
$(eval $(call M,7ffe1c7cdc3233e1e0c4b502df253974,sed-4.2.2.tar.bz2,https://ftp.gnu.org/gnu/sed/sed-4.2.2.tar.bz2))
$(eval $(call M,4e83f39fa2ffb610ac5ecd36865da6a2,sqlite-autoconf-3130000.tar.gz,https://www.sqlite.org/2016/sqlite-autoconf-3130000.tar.gz))
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
