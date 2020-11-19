NAME = ufdt_apply_overlay
SOURCES = ufdt_overlay.c \
          ufdt_convert.c \
          ufdt_node.c \
          ufdt_node_pool.c \
          ufdt_prop_dict.c \
          sysdeps/libufdt_sysdeps_posix.c \
          tests/src/ufdt_overlay_test_app.c \
          tests/src/util.c
CPPFLAGS += -Iinclude -Isysdeps/include -I/usr/include/$(DEB_HOST_MULTIARCH) -DHOST -DANDROID
LDFLAGS += -Wl,-rpath-link=. -L$(OUT_DIR) \
           -lfdt

build: $(SOURCES)
	mkdir --parents $(OUT_DIR)
	$(CC) $^ -o $(OUT_DIR)/$(NAME) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

