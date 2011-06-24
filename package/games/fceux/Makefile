all: fceux

PREFIX:=/usr/local
BINDIR:=${PREFIX}/bin
CC:=gcc
CXX:=g++
PKG_CONFIG:=pkg-config

FCEUX_CFLAGS:=$(CFLAGS) `$(PKG_CONFIG) sdl --cflags` -Isrc -Isrc/boards -Isrc/drivers/common -Isrc/fir \
	-Isrc/drivers/sdl -DPSS_STYLE=1 -DHAVE_ASPRINTF
FCEUX_CXXFLAGS:=$(FCEUX_CFLAGS)
FCEUX_LDFLAGS:= $(LDFLAGS) `$(PKG_CONFIG) sdl --libs` -lz -ldl -Wl,--as-needed

FCEUX_CXX_SRC=src/asm.cpp src/cart.cpp src/cheat.cpp src/conddebug.cpp src/config.cpp \
	  src/debug.cpp src/drawing.cpp src/emufile.cpp src/fceu.cpp src/fds.cpp \
	  src/file.cpp src/filter.cpp src/ines.cpp src/input.cpp \
	  src/movie.cpp src/netplay.cpp src/nsf.cpp src/oldmovie.cpp \
	  src/palette.cpp src/ppu.cpp src/sound.cpp src/state.cpp src/unif.cpp \
	  src/video.cpp src/vsuni.cpp src/wave.cpp src/x6502.cpp \
	  src/boards/01-222.cpp src/boards/103.cpp src/boards/106.cpp src/boards/108.cpp \
	  src/boards/112.cpp src/boards/117.cpp src/boards/120.cpp src/boards/121.cpp \
	  src/boards/15.cpp src/boards/164.cpp src/boards/175.cpp src/boards/176.cpp \
	  src/boards/177.cpp src/boards/178.cpp src/boards/179.cpp src/boards/183.cpp \
	  src/boards/185.cpp src/boards/186.cpp src/boards/187.cpp src/boards/189.cpp \
	  src/boards/199.cpp src/boards/208.cpp src/boards/222.cpp src/boards/235.cpp \
	  src/boards/23.cpp src/boards/253.cpp src/boards/3d-block.cpp src/boards/411120-c.cpp \
	  src/boards/43.cpp src/boards/57.cpp src/boards/603-5052.cpp src/boards/68.cpp \
	  src/boards/8157.cpp src/boards/8237.cpp src/boards/830118C.cpp src/boards/88.cpp \
	  src/boards/90.cpp src/boards/95.cpp src/boards/a9711.cpp src/boards/a9746.cpp \
	  src/boards/addrlatch.cpp src/boards/ax5705.cpp src/boards/bandai.cpp \
	  src/boards/bmc13in1jy110.cpp src/boards/bmc42in1r.cpp src/boards/bmc64in1nr.cpp \
	  src/boards/bmc70in1.cpp src/boards/bonza.cpp src/boards/bs-5.cpp \
	  src/boards/copyfami_mmc3.cpp src/boards/datalatch.cpp src/boards/deirom.cpp \
	  src/boards/dream.cpp src/boards/__dummy_mapper.cpp src/boards/edu2000.cpp \
	  src/boards/fk23c.cpp src/boards/ghostbusters63in1.cpp src/boards/gs-2004.cpp \
	  src/boards/gs-2013.cpp src/boards/h2288.cpp src/boards/karaoke.cpp \
	  src/boards/kof97.cpp src/boards/konami-qtai.cpp src/boards/ks7032.cpp \
	  src/boards/malee.cpp src/boards/mmc1.cpp src/boards/mmc3.cpp src/boards/mmc5.cpp \
	  src/boards/n106.cpp src/boards/n625092.cpp src/boards/n-c22m.cpp src/boards/novel.cpp \
	  src/boards/onebus.cpp src/boards/sachen.cpp src/boards/sc-127.cpp \
	  src/boards/sheroes.cpp src/boards/sl1632.cpp src/boards/smb2j.cpp src/boards/subor.cpp \
	  src/boards/super24.cpp src/boards/supervision.cpp src/boards/t-227-1.cpp \
	  src/boards/t-262.cpp src/boards/tengen.cpp src/boards/tf-1201.cpp \
	  src/drivers/common/args.cpp src/drivers/common/cheat.cpp src/drivers/common/config.cpp \
	  src/drivers/common/configSys.cpp src/drivers/common/hq2x.cpp src/drivers/common/hq3x.cpp \
	  src/drivers/common/scale2x.cpp src/drivers/common/scale3x.cpp src/drivers/common/scalebit.cpp \
	  src/drivers/common/vidblit.cpp \
	  src/drivers/sdl/config.cpp src/drivers/sdl/input.cpp \
	  src/drivers/sdl/sdl.cpp src/drivers/sdl/sdl-joystick.cpp \
	  src/drivers/sdl/sdl-sound.cpp src/drivers/sdl/sdl-throttle.cpp src/drivers/sdl/sdl-video.cpp \
	  src/drivers/sdl/unix-netplay.cpp \
	  src/input/arkanoid.cpp src/input/bworld.cpp src/input/cursor.cpp \
	  src/input/fkb.cpp src/input/ftrainer.cpp src/input/hypershot.cpp \
	  src/input/mahjong.cpp src/input/mouse.cpp src/input/oekakids.cpp \
	  src/input/powerpad.cpp src/input/quiz.cpp src/input/shadow.cpp \
	  src/input/suborkb.cpp src/input/toprider.cpp src/input/zapper.cpp \
	  src/utils/crc32.cpp src/utils/endian.cpp src/utils/general.cpp \
	  src/utils/guid.cpp src/utils/md5.cpp src/utils/memory.cpp \
	  src/utils/unzip.cpp src/utils/xstring.cpp \
	  src/mappers/151.cpp src/mappers/16.cpp src/mappers/17.cpp \
	  src/mappers/18.cpp src/mappers/193.cpp src/mappers/201.cpp \
	  src/mappers/202.cpp src/mappers/203.cpp src/mappers/204.cpp \
	  src/mappers/212.cpp src/mappers/213.cpp src/mappers/214.cpp \
	  src/mappers/215.cpp src/mappers/217.cpp src/mappers/21.cpp \
	  src/mappers/225.cpp src/mappers/227.cpp src/mappers/228.cpp \
	  src/mappers/229.cpp src/mappers/22.cpp src/mappers/230.cpp \
	  src/mappers/231.cpp src/mappers/232.cpp src/mappers/234.cpp \
	  src/mappers/241.cpp src/mappers/242.cpp src/mappers/244.cpp \
	  src/mappers/246.cpp src/mappers/24and26.cpp src/mappers/255.cpp \
	  src/mappers/25.cpp src/mappers/27.cpp src/mappers/32.cpp \
	  src/mappers/33.cpp src/mappers/40.cpp src/mappers/41.cpp \
	  src/mappers/42.cpp src/mappers/46.cpp src/mappers/50.cpp \
	  src/mappers/51.cpp src/mappers/59.cpp src/mappers/60.cpp \
	  src/mappers/61.cpp src/mappers/62.cpp src/mappers/65.cpp \
	  src/mappers/67.cpp src/mappers/69.cpp src/mappers/6.cpp \
	  src/mappers/71.cpp src/mappers/72.cpp src/mappers/73.cpp \
	  src/mappers/75.cpp src/mappers/76.cpp src/mappers/77.cpp \
	  src/mappers/79.cpp src/mappers/80.cpp src/mappers/82.cpp \
	  src/mappers/83.cpp src/mappers/85.cpp src/mappers/86.cpp \
	  src/mappers/89.cpp src/mappers/8.cpp src/mappers/91.cpp \
	  src/mappers/92.cpp src/mappers/97.cpp src/mappers/99.cpp \
	  src/mappers/mmc2and4.cpp src/mappers/simple.cpp

FCEUX_C_SRC=src/drivers/common/nes_ntsc.c src/utils/ConvertUTF.c src/mappers/emu2413.c

FCEUX_OBJ=${FCEUX_CXX_SRC:.cpp=.o} ${FCEUX_C_SRC:.c=.o}

fceux: ${FCEUX_OBJ}
	${CXX} -o $@ ${FCEUX_OBJ} ${FCEUX_LDFLAGS}

%.o : %.c
	${CC} ${FCEUX_CFLAGS} -c -o $@ $<

%.o : %.cpp
	${CXX} ${FCEUX_CXXFLAGS} -c -o $@ $<

clean:
	${RM} ${FCEUX_OBJ} fceux

install: fceux
	install -d ${DESTDIR}${BINDIR}
	install -m755 fceux ${DESTDIR}${BINDIR}/
