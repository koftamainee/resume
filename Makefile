SRC_DIR := src
BUILD_DIR := build
TARGET_DIR := target

SRCS := $(wildcard $(SRC_DIR)/*.tex)
PDFS := $(SRCS:$(SRC_DIR)/%.tex=$(BUILD_DIR)/%.pdf)
TARGETS := $(SRCS:$(SRC_DIR)/%.tex=$(TARGET_DIR)/%.pdf)

.PHONY: all clean

all: $(TARGETS)

$(BUILD_DIR)/%.pdf: $(SRC_DIR)/%.tex | $(BUILD_DIR)
	xelatex -interaction=nonstopmode -output-directory=$(BUILD_DIR) $<
	xelatex -interaction=nonstopmode -output-directory=$(BUILD_DIR) $<

$(TARGET_DIR)/%.pdf: $(BUILD_DIR)/%.pdf | $(TARGET_DIR)
	cp $< $@

$(BUILD_DIR) $(TARGET_DIR):
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR) $(TARGET_DIR)

.PHONY: all clean
