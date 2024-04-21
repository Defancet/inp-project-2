# INP 2. project - One-time Pad Encryption - MIPS64

## Author

- **Name:** Maksim Kalutski
- **Login:** xkalut00 

This repository contains the implementation of a simplified One-time pad encryption algorithm using the MIPS64 architecture and EduMIPS64 simulator. The implementation demonstrates a substitution cipher method for encryption.

## Project Overview

The One-time pad algorithm used here modifies each letter of a plaintext message based on a two-character key. Each letter of the plaintext is shifted forward in the alphabet by the ASCII difference from the first key character and then backwards by the ASCII difference from the second. If a number is encountered in the plaintext, the encryption terminates and outputs the ciphertext.


## Code Structure

- **Data Segment:** Initializes storage for the input (user login) and output (encrypted login).
- **Code Segment:** Contains the encryption logic implemented in MIPS64 assembly language.

## Encryption Details

- **Encryption Key:** Fixed at two characters, shifts each character of the message forward by the ASCII value of the first key character and backward by the second.
- **Termination Condition:** The presence of a numeric character in the input string stops the encryption process.
