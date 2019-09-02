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

$(eval $(call M,60d527254b3816c75a1c46517768b873af5767dfcc2083d6c527b567461c546c,apache-zookeeper-3.5.5.tar.gz,https://www-us.apache.org/dist/zookeeper/zookeeper-3.5.5/apache-zookeeper-3.5.5.tar.gz))
$(eval $(call M,6b11b477890a9c096ad856e0251920d1d8b9558b7d115256c027e0223755c793,apcu-5.1.17.tgz,https://pecl.php.net/get/apcu-5.1.17.tgz))
$(eval $(call M,e2e148f0b2e99b8e5c6caa09f6d4fb4dd3e83f744aa72a952f94f5a14436f7ea,apr-1.7.0.tar.bz2,http://www-us.apache.org/dist/apr/apr-1.7.0.tar.bz2))
$(eval $(call M,d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b,apr-util-1.6.1.tar.bz2,http://www-us.apache.org/dist/apr/apr-util-1.6.1.tar.bz2))
$(eval $(call M,50f97f4159805e374639a73e2636f22e,autoconf-2.69.tar.xz,https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz))
$(eval $(call M,53f38e7591fa57c3d2cee682be668e5b,automake-1.16.1.tar.xz,https://ftp.gnu.org/gnu/automake/automake-1.16.1.tar.xz))
$(eval $(call M,27159ac5ebf736dffd5636fd2cd625767c9e437de65baa63cb0de83570bd820d,bison-3.4.1.tar.xz,https://ftp.gnu.org/gnu/bison/bison-3.4.1.tar.xz))
$(eval $(call M,6aa9a5c6a4ca1016edd0ed1178e3cb87,boost_1_59_0.tar.bz2,https://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.bz2/download))
$(eval $(call M,ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269,bzip2-1.0.8.tar.gz,https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz))
$(eval $(call M,6cdb97871f2930530c97deb7cf5c8fa4be5a0b02c7cea6e7c7667672a39d6852,c-ares-1.15.0.tar.gz,http://c-ares.haxx.se/download/c-ares-1.15.0.tar.gz))
$(eval $(call M,2bf8d1d1ee345fc8a7915576f5649982,chrpath-0.16.tar.gz,https://src.fedoraproject.org/lookaside/extras/chrpath/chrpath-0.16.tar.gz/2bf8d1d1ee345fc8a7915576f5649982/chrpath-0.16.tar.gz))
$(eval $(call M,b8c0c7fbe0ef5e06e0c935f134304d44,clearsilver-0.10.5.tar.gz,http://www.clearsilver.net/downloads/clearsilver-0.10.5.tar.gz))
$(eval $(call M,7410851a783a41b521214ad987bb534a7e4a65e059651a2514e6ebfc8f46b218,cmake-3.9.6.tar.gz,https://cmake.org/files/v3.9/cmake-3.9.6.tar.gz))
$(eval $(call M,ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd,coreutils-8.31.tar.xz,https://ftp.gnu.org/gnu/coreutils/coreutils-8.31.tar.xz))
$(eval $(call M,f2d98854813948d157f6a91236ae34ca4a1b4cb302617cebad263d79b0235fea,curl-7.65.3.tar.xz,https://curl.haxx.se/download/curl-7.65.3.tar.xz))
$(eval $(call M,b3a7a6221c3dc916085f0d205abf6b8e1ba443d4dd965118da364a1dc1cb3a26,diffutils-3.7.tar.xz,https://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz))
$(eval $(call M,30e3f40acf9a8fdbd5c379bdcc8d1178a1d9af306de29fc8ece922bc4c57bef8,expat-2.2.7.tar.xz,https://github.com/libexpat/libexpat/releases/download/R_2_2_7/expat-2.2.7.tar.xz))
$(eval $(call M,c5fefbdf9858f7e4feb86f036e1247a54c79fc2d8e4b7064d5aaa1f47dfa789a,findutils-4.7.0.tar.xz,https://ftp.gnu.org/gnu/findutils/findutils-4.7.0.tar.xz))
$(eval $(call M,2882e3179748cc9f9c23ec593d6adc8d,flex-2.6.4.tar.gz,https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz))
$(eval $(call M,79874ef4eaa52025126b71d836453b8279bdd331,freetype-2.10.1.tar.xz,https://sourceforge.net/projects/freetype/files/freetype2/2.10.1/freetype-2.10.1.tar.xz/download))
$(eval $(call M,8e4e86f04ed789648b66f757329743a0d6dfb5294c3b91b756a474f1ce05a794,gawk-5.0.1.tar.xz,https://ftp.gnu.org/gnu/gawk/gawk-5.0.1.tar.xz))
$(eval $(call M,53f02fbbec9e798b0faaf7c73272f83608e835c6288dd58be6c9bb54624a3800,gettext-0.20.1.tar.xz,https://ftp.gnu.org/gnu/gettext/gettext-0.20.1.tar.xz))
$(eval $(call M,2e6fbeb6a91310a16efe181886c59596,googletest-release-1.8.1.tar.gz,https://github.com/google/googletest/archive/release-1.8.1.tar.gz))
$(eval $(call M,f58fa8001d60c4c77595fbbb62b63c1d,gmp-6.1.2.tar.xz,https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz))
$(eval $(call M,c6a852a817e9160c79bdb2d3101b4601,gperftools-2.7.tar.gz,https://github.com/gperftools/gperftools/releases/download/gperftools-2.7/gperftools-2.7.tar.gz))
$(eval $(call M,b960541c499619efd6afe1fa795402e4733c8e11ebf9fafccc0bb4bccdc5b514,grep-3.3.tar.xz,https://ftp.gnu.org/gnu/grep/grep-3.3.tar.xz))
$(eval $(call M,dd0c30cbc27049e87014bd948e7c323592dcef08,gsoap_2.8.91.zip,https://sourceforge.net/projects/gsoap2/files/gsoap-2.8/gsoap_2.8.91.zip/download))
$(eval $(call M,c91f74430bf7bc20402e1f657d0b252cb80aa66ba333a25704512af346633c68,gzip-1.10.tar.gz,https://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.gz))
$(eval $(call M,6d565680a4af0d2e261abbc3e3431b2b,hiredis-0.14.0.tar.gz,https://github.com/redis/hiredis/archive/v0.14.0.tar.gz))
$(eval $(call M,133d48298fe5315ae9366a0ec66282fa4040efa5d566174481077ade7d18ea40,httpd-2.4.41.tar.bz2,http://www-us.apache.org/dist/httpd/httpd-2.4.41.tar.bz2))
$(eval $(call M,2680f3c547cd26cba1d7ebd819cd336ff92cf444a270e195fd3b10bfdf22276c,icu4c-58_3-src.tgz,https://github.com/unicode-org/icu/releases/download/release-58-3/icu4c-58_3-src.tgz))
$(eval $(call M,93c62597eeef81a84d988bccbda1e990,jpeg-9c.tar.gz,http://ijg.org/files/jpegsrc.v9c.tar.gz))
$(eval $(call M,73e235c230708a8ac78ec11b886434a018f89691bd9e7fcf9c3128c8e677b435,jsoncpp-0.10.7.tar.gz,https://github.com/open-source-parsers/jsoncpp/archive/0.10.7.tar.gz))
$(eval $(call M,ab0462f2c9d546683e5147b1ce9c195fe95d07fac5bf362f6c01637955c3b492,libaio-0.3.112.tar.gz,https://releases.pagure.org/libaio/libaio-0.3.112.tar.gz))
$(eval $(call M,8643d50ed40c759f5412a3af4e353cffbce4fdf3b5cf321cb72cacf06b2d825e,libarchive-3.4.0.tar.gz,http://libarchive.org/downloads/libarchive-3.4.0.tar.gz))
$(eval $(call M,2d5526fc8da4f072dd5c73e18fbb1666f5ef8ed78b73bba12e195cfdd810344e,libev-4.27.tar.gz,http://dist.schmorp.de/libev/libev-4.27.tar.gz))
$(eval $(call M,a65bac6202ea8c5609fd5c7e480e6d25de467ea1917c08290c521752f147283d,libevent-2.1.11-stable.tar.gz,https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz))
$(eval $(call M,32f09f98ad52e11177d2400716749b9f,libfcgi-2.4.0.orig.tar.gz,http://http.debian.net/debian/pool/main/libf/libfcgi/libfcgi_2.4.0.orig.tar.gz))
$(eval $(call M,5d966cd1b56897543afeaac6eaca6888,libhugetlbfs-2.21.tar.gz,https://github.com/libhugetlbfs/libhugetlbfs/releases/download/2.21/libhugetlbfs-2.21.tar.gz))
$(eval $(call M,e6a1b1b589654277ee790cce3734f07876ac4ccfaecbee8afa0b649cf529cc04,libiconv-1.16.tar.gz,https://ftp.gnu.org/gnu/libiconv/libiconv-1.16.tar.gz))
$(eval $(call M,c4f491dd411a09e9de3b8702ea6f73eb,libmcrypt-2.5.8.tar.bz2,https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.bz2/download))
$(eval $(call M,b3958716b4e53ddc5992e6c49d97e819,libmemcached-1.0.18.tar.gz,https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz))
$(eval $(call M,3ab93fabbf4c27e1c4724371df408d9a1bd3f656,libpng-1.6.37.tar.xz,https://sourceforge.net/projects/libpng/files/libpng16/1.6.37/libpng-1.6.37.tar.xz/download))
$(eval $(call M,1bfb9b923f2c1339b4d2ce1807064aa5,libtool-2.4.6.tar.xz,https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz))
$(eval $(call M,94fb70890143e3c6549f265cee93ec064c80a84c42ad0f23e85ee1fd6540a871,libxml2-2.9.9.tar.gz,ftp://xmlsoft.org/libxml2/libxml2-2.9.9.tar.gz))
$(eval $(call M,8e36605144409df979cab43d835002f63988f3dc94d5d3537c12796db90e38c8,libxslt-1.1.33.tar.gz,ftp://xmlsoft.org/libxml2/libxslt-1.1.33.tar.gz))
$(eval $(call M,491fec9e89f1372f02a0ab66579aa2e9d63cac5178dfa672c204c88e693a908b,logrotate-3.15.1.tar.xz,https://github.com/logrotate/logrotate/releases/download/3.15.1/logrotate-3.15.1.tar.xz))
$(eval $(call M,658ba6191fa44c92280d4aa2c271b0f4fbc0e34d249578dd05e50e76d0e5efcc,lz4-1.9.2.tar.gz,https://github.com/lz4/lz4/archive/v1.9.2.tar.gz))
$(eval $(call M,730bb15d96fffe47e148d1e09235af82,m4-1.4.18.tar.xz,https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz))
$(eval $(call M,15b012617e7c44c0ed482721629577ac,make-4.2.1.tar.bz2,https://ftp.gnu.org/gnu/make/make-4.2.1.tar.bz2))
$(eval $(call M,ac7c5af6e8b1acf5d5c644d162e046d8acf9302174af9f24c3f18e5481ce3a0d,memcached-1.5.17.tar.gz,http://www.memcached.org/files/memcached-1.5.17.tar.gz))
$(eval $(call M,20786213ff92cd7ebdb0d0ac10dde1e9580a2f84296618b666654fd76ea307d4,memcached-3.1.3.tgz,https://pecl.php.net/get/memcached-3.1.3.tgz))
$(eval $(call M,f0b6d87dfcfe18b318905a3f91274051f3f17945,mod_fcgid-2.3.9.tar.bz2,http://www-us.apache.org/dist/httpd/mod_fcgid/mod_fcgid-2.3.9.tar.bz2))
$(eval $(call M,4125404e41e482ec68282a2e687f6c73,mpc-1.1.0.tar.gz,https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz))
$(eval $(call M,1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a,mpfr-4.0.2.tar.xz,https://ftp.gnu.org/gnu/mpfr/mpfr-4.0.2.tar.xz))
$(eval $(call M,b780beeb3a9cd9ce6a9043028527484df8e822c58c5274d4d67ec5ba2fc0a778,mysql++-3.2.5.tar.gz,https://tangentsoft.com/mysqlpp/releases/mysql++-3.2.5.tar.gz))
$(eval $(call M,d5eece21695f157cfbf87a75175973cd,mysql-5.7.27.tar.gz,http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.27.tar.gz))
$(eval $(call M,de2708609f4ca7ff6110cd594446030a,mysql-connector-c++-1.1.12.tar.gz,http://dev.mysql.com/get/Downloads/Connector-C++/mysql-connector-c++-1.1.12.tar.gz))
$(eval $(call M,98c889aaf8d23910d2b92d65be2e737a,ncurses-6.1.tar.gz,https://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz))
$(eval $(call M,a2d216450abd2beaf4e200c168957968e89d602ca4119338b9d7ab059fd4ce8b,nghttp2-1.39.2.tar.xz,https://github.com/nghttp2/nghttp2/releases/download/v1.39.2/nghttp2-1.39.2.tar.xz))
$(eval $(call M,3b84fe1c2cf9ca22fde370e486a9ab16b6427df1b6ea62cdb61978c9f34d0f3c,nginx-1.17.3.tar.gz,http://nginx.org/download/nginx-1.17.3.tar.gz))
$(eval $(call M,f6fb3079ad15076154eda9413fed42877d668e7069d9b87396d0804fdb3f4c90,openssl-1.1.1c.tar.gz,https://www.openssl.org/source/openssl-1.1.1c.tar.gz))
$(eval $(call M,78ad9937e4caadcba1526ef1853730d5,patch-2.7.6.tar.xz,https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz))
$(eval $(call M,91e762520003013834ac1adb4a938d53b22a216341c061b0cf05603b290faf6b,pcre-8.43.tar.bz2,https://sourceforge.net/projects/pcre/files/pcre/8.43/pcre-8.43.tar.bz2/download))
$(eval $(call M,eb597fcf8dc0a6211a42a6346de4f63ee166829a6df6d8ed767fe14be8d1c3a3,php-7.2.22.tar.xz,http://php.net/get/php-7.2.22.tar.xz/from/this/mirror))
$(eval $(call M,f6e931e319531b736fadc017f470e68a,pkg-config-0.29.2.tar.gz,http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz))
$(eval $(call M,3743beefa3dd6247a73f8f7a32c14c33,popt-1.16.tar.gz,https://src.fedoraproject.org/lookaside/extras/popt/popt-1.16.tar.gz/3743beefa3dd6247a73f8f7a32c14c33/popt-1.16.tar.gz))
$(eval $(call M,ff6742018c172c66ecc627029ad54280,protobuf-3.5.2.tar.gz,https://github.com/google/protobuf/archive/v3.5.2.tar.gz))
$(eval $(call M,e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461,readline-8.0.tar.gz,https://ftp.gnu.org/gnu/readline/readline-8.0.tar.gz))
$(eval $(call M,2885768cd0a29ff8d58a6280a270ff161f6a3deb5690b2be6c49f46d4c67bd6a,sed-4.7.tar.xz,https://ftp.gnu.org/gnu/sed/sed-4.7.tar.xz))
$(eval $(call M,053d8237eb9741b0e297073810668c2611a8e38e,sqlite-autoconf-3290000.tar.gz,https://www.sqlite.org/2019/sqlite-autoconf-3290000.tar.gz))
$(eval $(call M,d0d3ae07f103323be809bc3eac0dcc386d52c5262499fe05511ac4788af1fdd8,tar-1.32.tar.xz,https://ftp.gnu.org/gnu/tar/tar-1.32.tar.xz))
$(eval $(call M,3deebbb4d1ca77dd9c9e009a1ea02183,thrift-0.12.0.tar.gz,http://www-us.apache.org/dist/thrift/0.12.0/thrift-0.12.0.tar.gz))
$(eval $(call M,62b490407489521db863b523a7f86375,unzip60.tar.gz,https://sourceforge.net/projects/infozip/files/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz/download))
$(eval $(call M,743f9d0c7252b6db246b659c1e1ce0bd45d8d4508b4dfa427bbb4a3e9b9f62b5,util-linux-2.34.tar.xz,https://www.kernel.org/pub/linux/utils/util-linux/v2.34/util-linux-2.34.tar.xz))
$(eval $(call M,1695511daf585fcaf7816a401a6216f6,uuid-1.0.4.tgz,https://pecl.php.net/get/uuid-1.0.4.tgz))
$(eval $(call M,097ff1a324ae02e0a3b0369f07a7544a,which-2.21.tar.gz,https://ftp.gnu.org/gnu/which/which-2.21.tar.gz))
$(eval $(call M,b3264b15ab1db04c8c428dc81838d4eb,xz-5.2.4.tar.bz2,https://tukaani.org/xz/xz-5.2.4.tar.bz2))
$(eval $(call M,85adef240c5f370b308da8c938951a68,zlib-1.2.11.tar.xz,https://sourceforge.net/projects/libpng/files/zlib/1.2.11/zlib-1.2.11.tar.xz/download))
