CPPFLAGS= -fPIC -g -fno-inline -fno-builtin-inline -fno-inline-functions -fno-builtin
LDFLAGS= -shared

SOURCES = $(shell echo *.S)
HEADERS = $(shell echo *.h)
OBJECTS=$(SOURCES:.S=.o)

TARGET=libmemcpy.so

all: $(TARGET)

$(TARGET) : $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@ $(LDFLAGS)

install: $(TARGET)
	install -D $(TARGET) $(DESTDIR)$(prefix)/lib/aarch64-linux-gnu/$(TARGET)

clean:
	rm -f $(OBJECTS) $(TARGET)
