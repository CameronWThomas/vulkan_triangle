# Compiler flags:
#   -std=c++17  → use the C++17 standard
#   -O2         → optimization level 2 (fast code, without going overboard)
CFLAGS = -std=c++17 -O2

# Linker flags — libraries to link against:
#   -lglfw      → GLFW (window creation & input)
#   -lvulkan    → Vulkan loader (resolves Vulkan function calls at runtime)
#   -ldl        → dynamic linking support (needed by the Vulkan loader internally)
#   -lpthread   → POSIX threads (used by GLFW and Vulkan internally)
#   -lX11       → core X11 display server (GLFW needs this to create a window on Linux)
#   -lXxf86vm   → X11 video mode extension (used by GLFW for monitor/display info)
#   -lXrandr    → X11 screen resize/rotation extension (GLFW uses this for monitor support)
#   -lXi        → X11 input extension (GLFW uses this for raw input devices)
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

# Build rule: compile main.cpp into the executable "VulkanTest"
# Make will re-run this any time main.cpp is newer than VulkanTest
VulkanTest: main.cpp
	g++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS)

# .PHONY tells make that "test" and "clean" are not real files —
# so it always runs them even if a file with that name somehow existed
.PHONY: test clean

# "make test" → build VulkanTest if needed, then run it
test: VulkanTest
	./VulkanTest

# "make clean" → delete the compiled binary so you can do a fresh build
clean:
	rm -f VulkanTest