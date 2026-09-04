% Laboratory Work No. 11
% Emacs Text Editor
% Mikhail Vzvarov — NPIbd-01-25

# Laboratory Work No. 11

## Emacs Text Editor

**Discipline:** Operating Systems

**Student:** Mikhail Vzvarov  
**Group:** NPIbd-01-25

---

# Objective

- Become familiar with the Linux operating system.
- Obtain practical skills in working with the Emacs text editor.
- Learn basic Emacs keyboard commands.
- Practice working with buffers, windows, search and text editing.

---

# Emacs Basics

Emacs is a powerful and extensible text editor.

Main concepts:

- **Buffer** — contains text or other information.
- **Frame** — the main Emacs graphical frame.
- **Window** — an area displaying a buffer.
- **Minibuffer** — used to enter commands and additional information.
- **Point** — the current cursor position.
- **Mode** — defines editing behaviour for a particular type of content.

---

# Important Commands

    C-x C-f    Open a file
    C-x C-s    Save a file
    C-x C-c    Exit Emacs
    C-a        Beginning of line
    C-e        End of line
    M-<        Beginning of buffer
    M->        End of buffer
    C-k        Kill text to end of line
    C-y        Yank text
    C-x u      Undo

---

# Creating and Opening the File

The practical work was performed in:

    ~/reports/lab11

The created file was:

    lab011

It was opened in Emacs with:

    emacs lab011

![File opened in Emacs](<../images/Вставленное изображение (3).png>)

---

# Working with Buffers

Emacs can keep many buffers active at the same time.

The buffer list was opened with:

    C-x C-b

A different buffer can be selected with:

    C-x b

![Active Emacs buffers](<../images/Вставленное изображение (4).png>)

---

# Working with Windows

The Emacs frame was divided into several windows.

Commands used:

    C-x 3    Split vertically
    C-x 2    Split horizontally
    C-x o    Select another window
    C-x 1    Keep only the current window

![Emacs frame divided into windows](<../images/Вставленное изображение (5).png>)

---

# Text Search

Forward incremental search was started with:

    C-s

Other useful commands:

    C-r    Search backward
    M-%    Query replace
    C-g    Cancel the current operation

![Text search in Emacs](<../images/Вставленное изображение (6).png>)

---

# File Verification

The file contents were checked from the terminal with:

    cat -n lab011

This made it possible to verify the final contents after editing.

![Final file contents](<../images/Вставленное изображение (7).png>)

---

# Final Verification

At the end of the laboratory work, the working directory, available files and final contents were checked.

![Final verification](<../images/Вставленное изображение (8).png>)

---

# Results

During the laboratory work:

- a file was created and edited in Emacs;
- keyboard commands for editing and navigation were practiced;
- active buffers were examined;
- the frame was split into multiple windows;
- forward text search was performed;
- the final file was verified in the terminal.

---

# Conclusion

The basic features of the Emacs text editor were studied.

Practical skills were obtained in:

- editing text;
- using keyboard shortcuts;
- working with buffers;
- managing multiple windows;
- searching text.

The objective of the laboratory work was achieved.

---

# Thank You

## Questions?
