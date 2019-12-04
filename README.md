# GB-NES-PDF-HTML-ZIP

A Gameboy ROM that is also an NES ROM, a PDF File, an HTML File, and a ZIP File that contains its own source code

**_gb-nes-pdf-html-zip was created by Vi Grey (https://vigrey.com) <vi@vigrey.com> and is licensed under the BSD 2-Clause License._**

### Description:

GB-NES-PDF-HTML-ZIP is a Gameboy ROM that is also an NES ROM, a PDF File, an HTML File, and a ZIP File that contains its own source code.  You can use the source code that was extracted from the GB-NES-PDF-HTML-ZIP File to build the Gameboy ROM that is also an NES ROM, PDF File, HTML File, and ZIP File that contains its own source code.  This is a recursive Gameboy/NES/PDF/HTML/ZIP polyglot file.

This Gameboy ROM can be burned onto a 32KB Gameboy cartridge and it will work as a Gameboy game while retaining the NES ROM, PDF File, HTML File, and ZIP File, so if the Gameboy ROM is dumped from a Gameboy catridge, the resulting dumped Gameboy ROM file will also be a functioning NES ROM, PDF File, HTML File, and ZIP File.

### Platforms:
- Linux

### Build Dependencies:
- asm6 _(You'll probably have to build asm6 from source.  Make sure the asm6 binary is named **asm** and that the binary is executable and accessible in your PATH. The source code can be found at http://3dscapture.com/NES/asm6.zip)_
- rgbds
- zip

### Build Gameboy/NES/PDF/HTML/ZIP Polyglot File:

From a terminal, go to the the main directory of this project (the directory this README.md file exists in), you can then build the file with the following command.

    $ make

The resulting file will be located in at **bin/gb-nes-pdf-html-zip.gb**, **bin/gb-nes-pdf-html-zip.nes**, **bin/gb-nes-pdf-html-zip.pdf**, **bin/gb-nes-pdf-html-zip.html**, and **bin/gb-nes-pdf-html-zip.zip**.  These are all the same exact file, just with different file extensions for convenience.

### Cleaning Build Environment:

If you used `make` to build the polyglot, you can run the following command to clean up the build environment.

    $ make clean

### Play the Polyglot File in an NES Emulator:

To play the **NES** version of the file, change the file extension to **.nes** and open it up in an NES Emulator like FCEUX.

### Play the Polyglot File in a Gameboy Emulator:

To play the **Gameboy** version of the file, change the file extension to **.gb** and open it up in an Gameboy Emulator like BGB or VirtualBoyAdvance.

### Viewing the Polyglot File in a Web Browser:

To see the **html** version of the file, change the file extension to **.html**.  You should now be able to open it up in your web browser.

### Viewing the Polyglot File as a PDF File:

To see the **pdf** version of the file, change the file extension to **.pdf**.  You should now be able to open it up in your PDF file viewer, including Firefox and Chrome.

### Unzipping the Polyglot File:

Your zip file extractor should be able to extract this file, although you may have to change the file extension to **.zip** to make your zip file extractor work.

### Special Thanks

- Ange Albertini
- Evan Sultanik
- Evan Taren

A special thanks to these three individuals for inspiring me to see what I can do with file formats and polyglot files.

### License:
    Copyright (C) 2019, Vi Grey
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:

        1. Redistributions of source code must retain the above copyright
           notice, this list of conditions and the following disclaimer.
        2. Redistributions in binary form must reproduce the above copyright
           notice, this list of conditions and the following disclaimer in the
           documentation and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY AUTHOR AND CONTRIBUTORS \`\`AS IS'' AND
    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
    ARE DISCLAIMED. IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
    FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
    DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
    OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
    HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
    OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
    SUCH DAMAGE.
