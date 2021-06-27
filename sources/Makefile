CURL := curl --connect-timeout 10 --ftp-pasv --retry 3 --retry-delay 1 -L --max-redirs 3 --insecure --silent --show-error
SHA256SUM := sha256sum -b | awk '{print $$1; F=1}END{exit !F}'
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
	$(AT)if [ `$$(CAT) '$(2).dl' | $$(SHA256SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       else $$(ECHO) 'bad'; $$(RM) '$(2).dl'; $$(FALSE); fi
	$(AT)$$(MV) $(2).dl $(2)
check/$(2): $(2)
	$(AT)$$(ECHO) -n 'Checking $(2)...'
	$(AT)if [ `$$(CAT) '$(2)' | $$(SHA256SUM)` = '$(1)' ]; then $$(ECHO) 'ok'; \
       else $$(ECHO) 'bad'; $$(RM) '$(2)'; $$(FALSE); fi
endef

$(eval $(call M,3d11e467f01ff0936d8bdb51f80a18d1f38dd4f394b43a1d89cc7afc5cdb418d,apache-zookeeper-3.5.6.tar.gz,https://archive.apache.org/dist/zookeeper/zookeeper-3.5.6/apache-zookeeper-3.5.6.tar.gz))
$(eval $(call M,b99d40fafec06f4d132fcee53e7526ddbfc1d041ea6e04e17389dfad28f9c390,apcu-5.1.20.tgz,https://pecl.php.net/get/apcu-5.1.20.tgz))
$(eval $(call M,e2e148f0b2e99b8e5c6caa09f6d4fb4dd3e83f744aa72a952f94f5a14436f7ea,apr-1.7.0.tar.bz2,http://www-us.apache.org/dist/apr/apr-1.7.0.tar.bz2))
$(eval $(call M,d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b,apr-util-1.6.1.tar.bz2,http://www-us.apache.org/dist/apr/apr-util-1.6.1.tar.bz2))
$(eval $(call M,f14c83cfebcc9427f2c3cea7258bd90df972d92eb26752da4ddad81c87a0faa4,autoconf-2.71.tar.xz,https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz))
$(eval $(call M,ff2bf7656c4d1c6fdda3b8bebb21f09153a736bcba169aaf65eab25fa113bf3a,automake-1.16.3.tar.xz,https://ftp.gnu.org/gnu/automake/automake-1.16.3.tar.xz))
$(eval $(call M,67d68ce1e22192050525643fc0a7a22297576682bef6a5c51446903f5aeef3cf,bison-3.7.6.tar.xz,https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz))
$(eval $(call M,727a932322d94287b62abb1bd2d41723eec4356a7728909e38adb65ca25241ca,boost_1_59_0.tar.bz2,http://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.bz2/download))
$(eval $(call M,ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269,bzip2-1.0.8.tar.gz,https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz))
$(eval $(call M,d73dd0f6de824afd407ce10750ea081af47eba52b8a6cb307d220131ad93fc40,c-ares-1.17.1.tar.gz,http://c-ares.haxx.se/download/c-ares-1.17.1.tar.gz))
$(eval $(call M,bb0d4c54bac2990e1bdf8132f2c9477ae752859d523e141e72b3b11a12c26e7b,chrpath-0.16.tar.gz,https://src.fedoraproject.org/lookaside/extras/chrpath/chrpath-0.16.tar.gz/2bf8d1d1ee345fc8a7915576f5649982/chrpath-0.16.tar.gz))
$(eval $(call M,1e9da038deafddd3d0c1c510626c28be5a0f4f17b9091d577fd30e7c5ba88680,clearsilver-0.10.5.tar.gz,http://deb.debian.org/debian/pool/main/c/clearsilver/clearsilver_0.10.5.orig.tar.gz))
$(eval $(call M,12c8040ef5c6f1bc5b8868cede16bb7926c18980f59779e299ab52cbc6f15bb0,cmake-3.20.5.tar.gz,https://cmake.org/files/v3.20/cmake-3.20.5.tar.gz))
$(eval $(call M,4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa,coreutils-8.32.tar.xz,https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz))
$(eval $(call M,0f64582c54282f31c0de9f0a1a596b182776bd4df9a4c4a2a41bbeb54f62594b,curl-7.77.0.tar.xz,https://curl.haxx.se/download/curl-7.77.0.tar.xz))
$(eval $(call M,b3a7a6221c3dc916085f0d205abf6b8e1ba443d4dd965118da364a1dc1cb3a26,diffutils-3.7.tar.xz,https://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz))
$(eval $(call M,cf032d0dba9b928636548e32b327a2d66b1aab63c4f4a13dd132c2d1d2f2fb6a,expat-2.4.1.tar.xz,https://github.com/libexpat/libexpat/releases/download/R_2_4_1/expat-2.4.1.tar.xz))
$(eval $(call M,57127b7e97d91282c6ace556378d5455a9509898297e46e10443016ea1387164,findutils-4.8.0.tar.xz,https://ftp.gnu.org/gnu/findutils/findutils-4.8.0.tar.xz))
$(eval $(call M,e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995,flex-2.6.4.tar.gz,https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz))
$(eval $(call M,86a854d8905b19698bbc8f23b860bc104246ce4854dcea8e3b0fb21284f75784,freetype-2.10.4.tar.xz,https://sourceforge.net/projects/freetype/files/freetype2/2.10.4/freetype-2.10.4.tar.xz/download))
$(eval $(call M,cf5fea4ac5665fd5171af4716baab2effc76306a9572988d5ba1078f196382bd,gawk-5.1.0.tar.xz,https://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz))
$(eval $(call M,d20fcbb537e02dcf1383197ba05bd0734ef7bf5db06bdb241eb69b7d16b73192,gettext-0.21.tar.xz,https://ftp.gnu.org/gnu/gettext/gettext-0.21.tar.xz))
$(eval $(call M,b4870bf121ff7795ba20d20bcdd8627b8e088f2d1dab299a031c1034eddc93d5,googletest-release-1.11.0.tar.gz,https://github.com/google/googletest/archive/release-1.11.0.tar.gz))
$(eval $(call M,fd4829912cddd12f84181c3451cc752be224643e87fac497b69edddadc49b4f2,gmp-6.2.1.tar.xz,https://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.xz))
$(eval $(call M,ea566e528605befb830671e359118c2da718f721c27225cbbc93858c7520fee3,gperftools-2.9.1.tar.gz,https://github.com/gperftools/gperftools/releases/download/gperftools-2.9.1/gperftools-2.9.1.tar.gz))
$(eval $(call M,667e15e8afe189e93f9f21a7cd3a7b3f776202f417330b248c2ad4f997d9373e,grep-3.6.tar.xz,https://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz))
$(eval $(call M,6f6813b189d201022254a2879cc8ee005bdb1bcf126bc03238710f19ec4e7268,gsoap_2.8.115.zip,https://sourceforge.net/projects/gsoap2/files/gsoap_2.8.115.zip/download))
$(eval $(call M,c91f74430bf7bc20402e1f657d0b252cb80aa66ba333a25704512af346633c68,gzip-1.10.tar.gz,https://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.gz))
$(eval $(call M,2a0b5fe5119ec973a0c1966bfc4bd7ed39dbce1cb6d749064af9121fe971936f,hiredis-1.0.0.tar.gz,https://github.com/redis/hiredis/archive/refs/tags/v1.0.0.tar.gz))
$(eval $(call M,1bc826e7b2e88108c7e4bf43c026636f77a41d849cfb667aa7b5c0b86dbf966c,httpd-2.4.48.tar.bz2,http://www-us.apache.org/dist/httpd/httpd-2.4.48.tar.bz2))
$(eval $(call M,4cba7b7acd1d3c42c44bb0c14be6637098c7faf2b330ce876bc5f3b915d09745,icu4c-69_1-src.tgz,https://github.com/unicode-org/icu/releases/download/release-69-1/icu4c-69_1-src.tgz))
$(eval $(call M,6c434a3be59f8f62425b2e3c077e785c9ce30ee5874ea1c270e843f273ba71ee,jpeg-9d.tar.gz,http://ijg.org/files/jpegsrc.v9d.tar.gz))
$(eval $(call M,73e235c230708a8ac78ec11b886434a018f89691bd9e7fcf9c3128c8e677b435,jsoncpp-0.10.7.tar.gz,https://github.com/open-source-parsers/jsoncpp/archive/0.10.7.tar.gz))
$(eval $(call M,ab0462f2c9d546683e5147b1ce9c195fe95d07fac5bf362f6c01637955c3b492,libaio-0.3.112.tar.gz,https://releases.pagure.org/libaio/libaio-0.3.112.tar.gz))
$(eval $(call M,9015d109ec00bb9ae1a384b172bf2fc1dff41e2c66e5a9eeddf933af9db37f5a,libarchive-3.5.1.tar.gz,http://libarchive.org/downloads/libarchive-3.5.1.tar.gz))
$(eval $(call M,507eb7b8d1015fbec5b935f34ebed15bf346bed04a11ab82b8eee848c4205aea,libev-4.33.tar.gz,http://dist.schmorp.de/libev/libev-4.33.tar.gz))
$(eval $(call M,92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb,libevent-2.1.12-stable.tar.gz,https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz))
$(eval $(call M,c21f553f41141a847b2f1a568ec99a3068262821e4e30bc9d4b5d9091aa0b5f7,libfcgi-2.4.0.orig.tar.gz,http://http.debian.net/debian/pool/main/libf/libfcgi/libfcgi_2.4.0.orig.tar.gz))
$(eval $(call M,b70672f1e807c61b7eb3adf41c1903b42917951f2e7f8aef6821841700c04479,libhugetlbfs-2.23.tar.gz,https://github.com/libhugetlbfs/libhugetlbfs/releases/download/2.23/libhugetlbfs-2.23.tar.gz))
$(eval $(call M,e6a1b1b589654277ee790cce3734f07876ac4ccfaecbee8afa0b649cf529cc04,libiconv-1.16.tar.gz,https://ftp.gnu.org/gnu/libiconv/libiconv-1.16.tar.gz))
$(eval $(call M,bf2f1671f44af88e66477db0982d5ecb5116a5c767b0a0d68acb34499d41b793,libmcrypt-2.5.8.tar.bz2,https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.bz2/download))
$(eval $(call M,e22c0bb032fde08f53de9ffbc5a128233041d9f33b5de022c0978a2149885f82,libmemcached-1.0.18.tar.gz,https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz))
$(eval $(call M,a37b2f1b88fd1bfe74109586be463a434d34e773530fc2a74364cfcf734c032e,libmicrohttpd-0.9.73.tar.gz,https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.9.73.tar.gz))
$(eval $(call M,505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca,libpng-1.6.37.tar.xz,https://sourceforge.net/projects/libpng/files/libpng16/1.6.37/libpng-1.6.37.tar.xz/download))
$(eval $(call M,7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f,libtool-2.4.6.tar.xz,https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz))
$(eval $(call M,c8d6681e38c56f172892c85ddc0852e1fd4b53b4209e7f4ebf17f7e2eae71d92,libxml2-2.9.12.tar.gz,ftp://xmlsoft.org/libxml2/libxml2-2.9.12.tar.gz))
$(eval $(call M,98b1bd46d6792925ad2dfe9a87452ea2adebf69dcb9919ffd55bf926a7f93f7f,libxslt-1.1.34.tar.gz,ftp://xmlsoft.org/libxml2/libxslt-1.1.34.tar.gz))
$(eval $(call M,14a924e4804b3974e85019a9f9352c2a69726702e6656155c48bcdeace68a5dc,logrotate-3.18.1.tar.xz,https://github.com/logrotate/logrotate/releases/download/3.18.1/logrotate-3.18.1.tar.xz))
$(eval $(call M,030644df4611007ff7dc962d981f390361e6c97a34e5cbc393ddfbe019ffe2c1,lz4-1.9.3.tar.gz,https://github.com/lz4/lz4/archive/v1.9.3.tar.gz))
$(eval $(call M,63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96,m4-1.4.19.tar.xz,https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz))
$(eval $(call M,e05fdde47c5f7ca45cb697e973894ff4f5d79e13b750ed57d7b66d8defc78e19,make-4.3.tar.gz,https://ftp.gnu.org/gnu/make/make-4.3.tar.gz))
$(eval $(call M,d5a62ce377314dbffdb37c4467e7763e3abae376a16171e613cbe69956f092d1,memcached-1.6.9.tar.gz,http://www.memcached.org/files/memcached-1.6.9.tar.gz))
$(eval $(call M,b288e45f839593e16c4d8508b241de51a86df4f7322153e6becb9e1c819021fd,memcached-3.1.5.tgz,https://pecl.php.net/get/memcached-3.1.5.tgz))
$(eval $(call M,442c29528e34fefc946dd356fcf8240e1953aed89eb5597fc55898d3d06f183f,mod_fcgid-2.3.9.tar.bz2,http://www-us.apache.org/dist/httpd/mod_fcgid/mod_fcgid-2.3.9.tar.bz2))
$(eval $(call M,17503d2c395dfcf106b622dc142683c1199431d095367c6aacba6eec30340459,mpc-1.2.1.tar.gz,https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz))
$(eval $(call M,0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f,mpfr-4.1.0.tar.xz,https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.xz))
$(eval $(call M,839cfbf71d50a04057970b8c31f4609901f5d3936eaa86dab3ede4905c4db7a8,mysql++-3.2.5.tar.gz,https://tangentsoft.com/mysqlpp/releases/mysql++-3.2.5.tar.gz))
$(eval $(call M,78d2aeb1320226590755a5734383c2f61284c337dad7f947bdff345f790686a6,mysql-5.7.34.tar.gz,http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.34.tar.gz))
$(eval $(call M,49f082ed21c04348b7080d505ae0c85fd3bd1156ff511a3b53a97ab026243194,mysql-connector-c++-8.0.25-src.tar.gz,https://dev.mysql.com/get/Downloads/Connector-C++/mysql-connector-c++-8.0.25-src.tar.gz))
$(eval $(call M,30306e0c76e0f9f1f0de987cf1c82a5c21e1ce6568b9227f7da5b71cbea86c9d,ncurses-6.2.tar.gz,https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz))
$(eval $(call M,f7d54fa6f8aed29f695ca44612136fa2359013547394d5dffeffca9e01a26b0f,nghttp2-1.43.0.tar.xz,https://github.com/nghttp2/nghttp2/releases/download/v1.43.0/nghttp2-1.43.0.tar.xz))
$(eval $(call M,e462e11533d5c30baa05df7652160ff5979591d291736cfa5edb9fd2edb48c49,nginx-1.20.1.tar.gz,http://nginx.org/download/nginx-1.20.1.tar.gz))
$(eval $(call M,892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5,openssl-1.1.1k.tar.gz,https://www.openssl.org/source/openssl-1.1.1k.tar.gz))
$(eval $(call M,6444204b9c34e6eb6c0b23021ce89a0370dad2b2f5c00cd44c342753e0b204d9,onig-6.9.7.tar.gz,https://github.com/kkos/oniguruma/releases/download/v6.9.7.1/onig-6.9.7.1.tar.gz))
$(eval $(call M,ac610bda97abe0d9f6b7c963255a11dcb196c25e337c61f94e4778d632f1d8fd,patch-2.7.6.tar.xz,https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz))
$(eval $(call M,4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8,pcre-8.45.tar.bz2,https://ftp.pcre.org/pub/pcre/pcre-8.45.tar.bz2))
$(eval $(call M,1fa46ca6790d780bf2cb48961df65f0ca3640c4533f0bca743cd61b71cb66335,php-7.4.20.tar.xz,http://php.net/get/php-7.4.20.tar.xz/from/this/mirror))
$(eval $(call M,6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591,pkg-config-0.29.2.tar.gz,http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz))
$(eval $(call M,5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24fdc5d1,popt-1.18.tar.gz,https://ftp.osuosl.org/pub/rpm/popt/releases/popt-1.x/popt-1.18.tar.gz))
$(eval $(call M,77ad26d3f65222fd96ccc18b055632b0bfedf295cb748b712a98ba1ac0b704b2,protobuf-3.17.3.tar.gz,https://github.com/protocolbuffers/protobuf/releases/download/v3.17.3/protobuf-all-3.17.3.tar.gz))
$(eval $(call M,f8ceb4ee131e3232226a17f51b164afc46cd0b9e6cef344be87c65962cb82b02,readline-8.1.tar.gz,https://ftp.gnu.org/gnu/readline/readline-8.1.tar.gz))
$(eval $(call M,f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633,sed-4.8.tar.xz,https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz))
$(eval $(call M,bd90c3eb96bee996206b83be7065c9ce19aef38c3f4fb53073ada0d0b69bbce3,sqlite-autoconf-3360000.tar.gz,https://www.sqlite.org/2021/sqlite-autoconf-3360000.tar.gz))
$(eval $(call M,63bebd26879c5e1eea4352f0d03c991f966aeb3ddeb3c7445c902568d5411d28,tar-1.34.tar.xz,https://ftp.gnu.org/gnu/tar/tar-1.34.tar.xz))
$(eval $(call M,4191bfc0b7490e20cc69f9f4dc6e991fbb612d4551aa9eef1dbf7f4c47ce554d,thrift-0.14.2.tar.gz,http://www-us.apache.org/dist/thrift/0.14.2/thrift-0.14.2.tar.gz))
$(eval $(call M,036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37,unzip60.tar.gz,https://sourceforge.net/projects/infozip/files/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz/download))
$(eval $(call M,bd07b7e98839e0359842110525a3032fdb8eaf3a90bedde3dd1652d32d15cce5,util-linux-2.37.tar.xz,https://www.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.tar.xz))
$(eval $(call M,5cb834d32fa7d270494aa47fd96e062ef819df59d247788562695fd1f4e470a4,uuid-1.2.0.tgz,https://pecl.php.net/get/uuid-1.2.0.tgz))
$(eval $(call M,f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad,which-2.21.tar.gz,https://ftp.gnu.org/gnu/which/which-2.21.tar.gz))
$(eval $(call M,5117f930900b341493827d63aa910ff5e011e0b994197c3b71c08a20228a42df,xz-5.2.5.tar.bz2,https://tukaani.org/xz/xz-5.2.5.tar.bz2))
$(eval $(call M,4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066,zlib-1.2.11.tar.xz,https://sourceforge.net/projects/libpng/files/zlib/1.2.11/zlib-1.2.11.tar.xz/download))
