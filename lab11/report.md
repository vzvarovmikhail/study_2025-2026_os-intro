# Laboratory Work No. 11

## Emacs Text Editor

**Discipline:** Operating Systems  
**Student:** Mikhail Vzvarov  
**Group:** NPIbd-01-25  

---

## Objective

The objective of this laboratory work is to become familiar with Linux and obtain practical skills in working with the Emacs text editor.

## Tasks

1. Become familiar with Emacs and its terminology.
2. Create and edit a file in Emacs.
3. Practice standard text-editing operations using keyboard shortcuts.
4. Practice cursor movement.
5. Work with buffers.
6. Work with multiple windows.
7. Practice search and replacement.
8. Review the results.

## Theoretical Information

Emacs is a powerful screen-oriented and extensible text editor. Its important concepts include a buffer, frame, window, minibuffer, point and editing mode.

A buffer contains text or other information. A frame is the Emacs application frame. A window is a rectangular area of a frame that displays a buffer. The minibuffer is used to enter additional information and commands. The point specifies the current insertion or deletion position.

Emacs commands frequently use Ctrl and Meta prefixes. In Emacs notation they are written as C- and M-. Alt can normally be used as Meta on a PC keyboard.

Important commands include:

    C-x C-f    Open a file
    C-x C-s    Save a file
    C-x C-c    Exit Emacs
    C-a        Beginning of line
    C-e        End of line
    M-<        Beginning of buffer
    M->        End of buffer
    C-k        Kill text to end of line
    C-y        Yank text
    C-space    Start selecting a region
    M-w        Copy a region
    C-w        Kill a region
    C-x u      Undo
    C-x C-b    Display buffer list
    C-x b      Switch buffer
    C-x 2      Split horizontally
    C-x 3      Split vertically
    C-x o      Select another window
    C-s        Search forward
    C-r        Search backward
    M-%        Query replace

## Laboratory Procedure

### 1. Working Directory

The work was performed in:

    ~/reports/lab11

The directory and its files were checked in the terminal. The file created during the practical work was named lab011.

![Working directory and files](<images/Вставленное изображение.png>)

### 2. Reviewing the Created File

The file was displayed with line numbers:

    cat -n lab011

This command was used to verify the contents created in Emacs.

![Contents of lab011](<images/Вставленное изображение (2).png>)

### 3. Editing the File in Emacs

The file was opened with:

    emacs lab011

Keyboard shortcuts were used to perform the editing operations and navigate through the file.

![File opened in Emacs](<images/Вставленное изображение (3).png>)

### 4. Working with Buffers

The list of active buffers was displayed with:

    C-x C-b

Buffers allow Emacs to keep several files and internal data objects open simultaneously.

![Active Emacs buffers](<images/Вставленное изображение (4).png>)

### 5. Working with Windows

The Emacs frame was divided into multiple windows using:

    C-x 3
    C-x 2
    C-x o
    C-x 2

The command C-x o was used to move between windows.

![Emacs frame divided into windows](<images/Вставленное изображение (5).png>)

### 6. Searching for Text

Forward incremental search was started with:

    C-s

Repeated C-s moves to another match. C-g terminates the current search operation.

![Text search in Emacs](<images/Вставленное изображение (6).png>)

Emacs also provides backward search with C-r and query replacement with M-%.

### 7. Final File Review

After finishing the work in Emacs, the file was reviewed again:

    cat -n lab011

![Final file contents](<images/Вставленное изображение (7).png>)

### 8. Final Verification

The working directory, files and final contents were checked together.

![Final verification](<images/Вставленное изображение (8).png>)

## Conclusion

During the laboratory work, practical skills in using Emacs were obtained. The concepts of buffers, frames, windows and the minibuffer were studied. A file was created and edited, keyboard commands were used for navigation and editing, buffers were examined, the frame was split into multiple windows, and text search was practiced. The objective of the laboratory work was achieved.

# Control Questions

## 1. Briefly describe the Emacs editor.

Emacs is a powerful and extensible screen-oriented text editor. It supports editing, multiple buffers and windows, different modes, search and replacement, built-in help and many keyboard commands. It can be extended using Emacs Lisp.

## 2. What features can make Emacs difficult for a beginner?

Emacs has many commands and keyboard shortcuts. Many operations use Ctrl and Meta combinations, sometimes in sequences. A beginner must also learn Emacs-specific concepts such as buffers, windows, frames, modes and the minibuffer.

## 3. What are a buffer and a window in Emacs terminology?

A buffer is an object containing text or other information. A window is a rectangular area of an Emacs frame that displays a buffer. Several windows can display different buffers or different parts of one buffer.

## 4. Is it possible to open more than 10 buffers in one window?

Yes. Emacs can keep many buffers active simultaneously. A window displays one buffer at a time, and C-x b can be used to switch which buffer is displayed.

## 5. Which buffers are created by default when Emacs starts?

The exact set can depend on the version and configuration. A standard session normally includes internal buffers such as *scratch* and *Messages*.

## 6. Which keys are pressed for C-c | and C-c C-|?

For C-c |, hold Ctrl and press c, release the keys, then type |.

For C-c C-|, hold Ctrl and press c, release the keys, then hold Ctrl and press |. The physical key used for | depends on the keyboard layout.

## 7. How can the current window be divided into two parts?

C-x 2 splits the current window horizontally. C-x 3 splits it vertically.

## 8. In which file are Emacs settings stored?

A traditional Emacs initialization file is:

    ~/.emacs

An Emacs configuration may also use an initialization file in the .emacs.d directory.

## 9. What function does a key perform, and can it be reassigned?

Keys and key combinations in Emacs are associated with commands through key bindings. Pressing a key executes its bound command. Key bindings can be changed, so commands can be reassigned.

## 10. Which editor was more convenient, vi or Emacs? Explain why.

For this work, Emacs was more convenient for visually working with buffers and multiple windows because these elements are clearly displayed in its interface. vi is convenient for fast terminal editing and has a compact modal approach. The preferred editor depends on the task and the user's experience.

# Bibliography

1. Laboratory work guidelines: “Emacs Text Editor”.
2. Kulyabov D. S. et al. Operating Systems. Course and laboratory materials.
3. GNU Emacs built-in documentation and Info system.
4. Cameron D., Elliott J., Loy M., Raymond E. S., Rosenblatt B. Learning GNU Emacs. O'Reilly Media.
5. Linux manual and help resources for command-line and text-editing tools.
