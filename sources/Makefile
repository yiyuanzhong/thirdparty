CURL = curl --connect-timeout 10 --ftp-pasv --retry 3 --retry-delay 1 -L --max-redirs 3 --silent
MD5SUM = (md5sum -b --tag || md5 || openssl md5)
FALSE = false
ECHO = echo
RM = rm -fv
MV = mv -f
AWK = awk
CAT = cat

all:
check:

define M
.PHONY: check/$(2)
check: check/$(2)
all: $(2)
$(2):
	@$$(ECHO) 'Downloading $(2)'
	@$$(CURL) -o $(2).dl '$(3)' || ($$(RM) $(2).dl; $$(FALSE))
	@if [ `$$(CAT) $(2).dl | $$(MD5SUM) | $$(AWK) '{ print $$$$NF }'` != '$(1)' ]; then $$(RM) $(2).dl; $$(FALSE); fi
	@$$(MV) $(2).dl $(2)
check/$(2):
	@$$(ECHO) 'Checking $(2)'
	@if [ `$$(CAT) $(2) | $$(MD5SUM) | $$(AWK) '{ print $$$$NF }'` != '$(1)' ]; then $$(RM) $(2); $$(FALSE); fi
endef

$(eval $(call M,5486180ec5a23efb5cae6d4292b300ab,apr-1.5.1.tar.bz2,http://mirrors.cnnic.cn/apache/apr/apr-1.5.1.tar.bz2))
$(eval $(call M,2202b18f269ad606d70e1864857ed93c,apr-util-1.5.4.tar.bz2,http://mirrors.cnnic.cn/apache/apr/apr-util-1.5.4.tar.bz2))
$(eval $(call M,50f97f4159805e374639a73e2636f22e,autoconf-2.69.tar.xz,http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz))
$(eval $(call M,9a1ddb0e053474d9d1105cfe39b0c48d,automake-1.15.tar.xz,http://ftp.gnu.org/gnu/automake/automake-1.15.tar.xz))
$(eval $(call M,c342201de104cc9ce0a21e0ad10d4021,bison-3.0.4.tar.xz,http://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.xz))
$(eval $(call M,d6eef4b4cacb2183f2bf265a5a03a354,boost_1_55_0.tar.bz2,http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.bz2/download))
$(eval $(call M,1be49befbdd9a5ce9def2983ba3e7b76,boost_1_57_0.tar.bz2,http://sourceforge.net/projects/boost/files/boost/1.57.0/boost_1_57_0.tar.bz2/download))
$(eval $(call M,00b516f4704d4a7cb50a1d97e6e8e15b,bzip2-1.0.6.tar.gz,http://bzip.org/1.0.6/bzip2-1.0.6.tar.gz))
$(eval $(call M,1196067641411a75d3cbebe074fd36d8,c-ares-1.10.0.tar.gz,http://c-ares.haxx.se/download/c-ares-1.10.0.tar.gz))
$(eval $(call M,2bf8d1d1ee345fc8a7915576f5649982,chrpath-0.16.tar.gz,https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz))
$(eval $(call M,b8c0c7fbe0ef5e06e0c935f134304d44,clearsilver-0.10.5.tar.gz,http://www.clearsilver.net/downloads/clearsilver-0.10.5.tar.gz))
$(eval $(call M,63f436aa19b5efc37017759c8d3953ca,cmake-3.2.1.tar.gz,http://www.cmake.org/files/v3.2/cmake-3.2.1.tar.gz))
$(eval $(call M,abed135279f87ad6762ce57ff6d89c41,coreutils-8.23.tar.xz,http://ftp.gnu.org/gnu/coreutils/coreutils-8.23.tar.xz))
$(eval $(call M,3d75ba516673ddc441dac8d519d2634d,curl-7.41.0.tar.lzma,http://curl.haxx.se/download/curl-7.41.0.tar.lzma))
$(eval $(call M,d15060a813b91383a9f3c66faf84867e,fcgi-2.4.0.tar.gz,http://www.fastcgi.com/dist/fcgi-2.4.0.tar.gz))
$(eval $(call M,a8a8176282fd28e8d1234c84d847fa66,findutils-4.5.14.tar.gz,http://alpha.gnu.org/gnu/findutils/findutils-4.5.14.tar.gz))
$(eval $(call M,477679c37ff8b28248a9b05f1da29a82,flex-2.5.39.tar.xz,http://sourceforge.net/projects/flex/files/flex-2.5.39.tar.xz/download))
$(eval $(call M,2a7a314927011d5030903179cf183be0,freetype-2.5.5.tar.bz2,http://sourceforge.net/projects/freetype/files/freetype2/2.5.5/freetype-2.5.5.tar.bz2/download))
$(eval $(call M,997c9070354eff5517115feaea6038f0,gettext-0.19.4.tar.xz,http://ftp.gnu.org/gnu/gettext/gettext-0.19.4.tar.xz))
$(eval $(call M,073b984d8798ea1594f5e44d85b20d66,gmock-1.7.0.zip,https://googlemock.googlecode.com/files/gmock-1.7.0.zip))
$(eval $(call M,2171cea3bbe053036fb5d5d25176a160,gperftools-2.4.tar.gz,https://googledrive.com/host/0B6NtGsLhIcf7MWxMMF9JdTN3UVk/gperftools-2.4.tar.gz))
$(eval $(call M,1464dde38e032809ec722100f4131942,gsoap_2.8.21.zip,http://sourceforge.net/projects/gsoap2/files/gSOAP/gsoap_2.8.21.zip/download))
$(eval $(call M,38603cb2843bf5681ff41aab3bcd6a20,gzip-1.6.tar.gz,http://ftp.gnu.org/gnu/gzip/gzip-1.6.tar.gz))
$(eval $(call M,914e4aa8ab4a3f60d5739d2106e50502,hiredis-0.12.1.tar.gz,https://github.com/redis/hiredis/archive/v0.12.1.tar.gz))
$(eval $(call M,b8dc8367a57a8d548a9b4ce16d264a13,httpd-2.4.12.tar.bz2,http://mirrors.cnnic.cn/apache/httpd/httpd-2.4.12.tar.bz2))
$(eval $(call M,3353992aecaee1805ef4109aadd433e7,jpegsrc.v9a.tar.gz,http://ijg.org/files/jpegsrc.v9a.tar.gz))
$(eval $(call M,8ac9674076515e5a1b3b4ab449e571b8,jsoncpp-0.10.1.tar.gz,https://github.com/open-source-parsers/jsoncpp/archive/0.10.1.tar.gz))
$(eval $(call M,efad5a503f66329bb9d2f4308b5de98a,libarchive-3.1.2.tar.gz,http://libarchive.org/downloads/libarchive-3.1.2.tar.gz))
$(eval $(call M,01d1c672697f649b4f94abd0b70584ff,libev-4.19.tar.gz,http://dist.schmorp.de/libev/libev-4.19.tar.gz))
$(eval $(call M,c4c56f986aa985677ca1db89630a2e11,libevent-2.0.22-stable.tar.gz,http://sourceforge.net/projects/levent/files/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz/download))
$(eval $(call M,e34509b1623cec449dfeb73d7ce9c6c6,libiconv-1.14.tar.gz,http://ftp.gnu.org/gnu/libiconv/libiconv-1.14.tar.gz))
$(eval $(call M,c4f491dd411a09e9de3b8702ea6f73eb,libmcrypt-2.5.8.tar.bz2,http://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.bz2/download))
$(eval $(call M,b3958716b4e53ddc5992e6c49d97e819,libmemcached-1.0.18.tar.gz,https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz))
$(eval $(call M,23b7286b5d4a86de950fd2ffc5cac742,libpng-1.6.16.tar.xz,http://sourceforge.net/projects/libpng/files/libpng16/1.6.16/libpng-1.6.16.tar.xz/download))
$(eval $(call M,1bfb9b923f2c1339b4d2ce1807064aa5,libtool-2.4.6.tar.xz,http://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz))
$(eval $(call M,a4930f5743ce2e7b4f2a1cd898b9bdc6,libxls-1.4.0.zip,http://sourceforge.net/projects/libxls/files/libxls-1.4.0.zip/download))
$(eval $(call M,9e6a9aca9d155737868b3dc5fd82f788,libxml2-2.9.2.tar.gz,ftp://xmlsoft.org/libxml2/libxml2-2.9.2.tar.gz))
$(eval $(call M,9667bf6f9310b957254fdcf6596600b7,libxslt-1.1.28.tar.gz,ftp://xmlsoft.org/libxml2/libxslt-1.1.28.tar.gz))
$(eval $(call M,4492b145b6d542e4a2f41e77fa199ab0,logrotate-3.9.1.tar.gz,https://fedorahosted.org/releases/l/o/logrotate/logrotate-3.9.1.tar.gz))
$(eval $(call M,12a3c829301a4fd6586a57d3fcf196dc,m4-1.4.17.tar.xz,http://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.xz))
$(eval $(call M,57a7a224a822f94789a587ccbcedff69,make-4.1.tar.bz2,http://ftp.gnu.org/gnu/make/make-4.1.tar.bz2))
$(eval $(call M,2b7eefa17c811998f4cd55bfabc12b8e,memcached-1.4.22.tar.gz,http://www.memcached.org/files/memcached-1.4.22.tar.gz))
$(eval $(call M,28937c6144f734e000c6300242f44ce6,memcached-2.2.0.tgz,https://pecl.php.net/get/memcached-2.2.0.tgz))
$(eval $(call M,262a8c59bceee5fcb669dd92a85c637d,mod_fcgid-2.3.9.tar.bz2,http://mirrors.cnnic.cn/apache/httpd/mod_fcgid/mod_fcgid-2.3.9.tar.bz2))
$(eval $(call M,1397502eac7f0a9800116411e8b21187,mysql++-3.2.2.tar.gz,http://www.tangentsoft.net/mysql++/releases/mysql++-3.2.2.tar.gz))
$(eval $(call M,68e1911f70eb1b02170d4f96bf0f0f88,mysql-5.6.24.tar.gz,http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.24.tar.gz))
$(eval $(call M,8cb9c412e5f2d96bc6f459aa8c6282a1,ncurses-5.9.tar.gz,http://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz))
$(eval $(call M,d1b55031ae6e4bce37f8776b94d8b930,nginx-1.6.2.tar.gz,http://nginx.org/download/nginx-1.6.2.tar.gz))
$(eval $(call M,d143d1555d842a069cb7cc34ba745a06,openssl-1.0.1m.tar.gz,https://www.openssl.org/source/openssl-1.0.1m.tar.gz))
$(eval $(call M,e3da7940431633fb65a01b91d3b7a27a,patch-2.7.5.tar.xz,http://ftp.gnu.org/gnu/patch/patch-2.7.5.tar.xz))
$(eval $(call M,b767bc9af0c20bc9c1fe403b0d41ad97,pcre-8.36.tar.bz2,http://sourceforge.net/projects/pcre/files/pcre/8.36/pcre-8.36.tar.bz2/download))
$(eval $(call M,692f9bc5649806f2053eee1e7323b7ea,php-5.5.23.tar.xz,http://cn2.php.net/get/php-5.5.23.tar.xz/from/this/mirror))
$(eval $(call M,aa3c86e67551adc3ac865160e34a2a0d,pkg-config-0.28.tar.gz,http://pkgconfig.freedesktop.org/releases/pkg-config-0.28.tar.gz))
$(eval $(call M,3743beefa3dd6247a73f8f7a32c14c33,popt-1.16.tar.gz,http://rpm5.org/files/popt/popt-1.16.tar.gz))
$(eval $(call M,11aaac2d704eef8efd1867a807865d85,protobuf-2.6.1.tar.bz2,https://github.com/google/protobuf/releases/download/v2.6.1/protobuf-2.6.1.tar.bz2))
$(eval $(call M,33c8fb279e981274f485fd91da77e94a,readline-6.3.tar.gz,http://ftp.gnu.org/gnu/readline/readline-6.3.tar.gz))
$(eval $(call M,7ffe1c7cdc3233e1e0c4b502df253974,sed-4.2.2.tar.bz2,http://ftp.gnu.org/gnu/sed/sed-4.2.2.tar.bz2))
$(eval $(call M,99278080035e7c04ac4e505518047274,snacc-1.3.1.tar.bz2,http://ftp.cn.debian.org/debian/pool/main/s/snacc/snacc_1.3.1.orig.tar.bz2))
$(eval $(call M,51272e875879ee893e51070b07c33888,sqlite-autoconf-3080803.tar.gz,http://sqlite.org/2015/sqlite-autoconf-3080803.tar.gz))
$(eval $(call M,e0382a4064e09a4943f3adeff1435978,tar-1.27.1.tar.xz,http://ftp.gnu.org/gnu/tar/tar-1.27.1.tar.xz))
$(eval $(call M,d2e46148f6e800a9492dbd848c66ab6e,thrift-0.9.1.tar.gz,http://mirrors.cnnic.cn/apache/thrift/0.9.1/thrift-0.9.1.tar.gz))
$(eval $(call M,89f63cc4d0100912f4a1f8a9dee63678,thrift-0.9.2.tar.gz,http://mirrors.cnnic.cn/apache/thrift/0.9.2/thrift-0.9.2.tar.gz))
$(eval $(call M,c1b864c96804a10526540c664ade67f0,tinyxml_2_6_2.tar.gz,http://sourceforge.net/projects/tinyxml/files/tinyxml/2.6.2/tinyxml_2_6_2.tar.gz/download))
$(eval $(call M,62b490407489521db863b523a7f86375,unzip60.tar.gz,http://sourceforge.net/projects/infozip/files/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz/download))
$(eval $(call M,54ba880f1d66782c2287ee2c898520e9,util-linux-2.21.2.tar.xz,https://www.kernel.org/pub/linux/utils/util-linux/v2.21/util-linux-2.21.2.tar.xz))
$(eval $(call M,236c3f2f5c5e9ce0aa2f024618c060a1,uuid-1.0.3.tgz,https://pecl.php.net/get/uuid-1.0.3.tgz))
$(eval $(call M,567336ebee41552195c4035c87b9361b,xlslib-package-2.5.0.zip,http://sourceforge.net/projects/xlslib/files/xlslib-package-2.5.0.zip/download))
$(eval $(call M,d484910b26fec5aff99ee66350589e29,xz-5.2.1.tar.bz2,http://tukaani.org/xz/xz-5.2.1.tar.bz2))
$(eval $(call M,dfa9db802c504a6bb81806cfe48f34f9,yii-1.1.16.bca042.tar.gz,https://github.com/yiisoft/yii/releases/download/1.1.16/yii-1.1.16.bca042.tar.gz))
$(eval $(call M,44d667c142d7cda120332623eab69f40,zlib-1.2.8.tar.gz,http://zlib.net/zlib-1.2.8.tar.gz))
$(eval $(call M,971c379ba65714fd25dc5fe8f14e9ad1,zookeeper-3.4.6.tar.gz,http://mirrors.cnnic.cn/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz))
