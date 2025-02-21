PORTNAME=	Geekbench
PORTVERSION=	6.4.0
CATEGORIES=	benchmarks
MASTER_SITES=	https://cdn.geekbench.com/
PKGNAMESUFFIX=  -dev
DISTVERSIONSUFFIX=-Linux
DIST_SUBDIR=    ${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=	your.email@example.com
COMMENT=	Cross-platform benchmark for CPU and GPU performance
WWW=		https://www.geekbench.com

LICENSE=	EULA
LICENSE_NAME=	Geekbench End User License Agreement
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

# Dependencies for Linuxulator
#RUN_DEPENDS=	linux_base-c7>0:emulators/linux_base-c7

# No build step since it’s a prebuilt Linux binary
NO_BUILD=	yes
NO_ARCH=	yes  # Architecture-independent (Linux binary runs via emulation)

# Specify it’s a Linux binary
USE_LINUX=	yes

# Customize extraction if the tarball unpacks to a different directory
WRKSRC=		${WRKDIR}/Geekbench-${PORTVERSION}-Linux

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/geekbench6 ${STAGEDIR}${PREFIX}/bin/

.include <bsd.port.mk>
