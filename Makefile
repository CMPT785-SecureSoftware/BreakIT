# Compiler and Flags
CXX = g++
CXXFLAGS = -std=c++17 -O2 -Wno-deprecated-declarations
INCLUDES = -I include
LIBS = -lssl -lcrypto

# Source Files
SRC = src/main.cpp src/shell.cpp src/fs_utils.cpp src/encrypted_fs.cpp \
      src/crypto_utils.cpp src/user_metadata.cpp src/shared_metadata.cpp \
      src/sharing_key_manager.cpp src/utils.cpp src/password_utils.cpp

# Object Files
OBJ = $(SRC:.cpp=.o)

# Output Executable
TARGET = fileserver

# Default Make Target
all: $(TARGET)

# Compile the Executable
$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -o $(TARGET) $(OBJ) $(LIBS)

# Compile Object Files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Clean Build Artifacts
clean:
	rm -f $(OBJ) $(TARGET)
