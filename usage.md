# **Cat-Themed Programming Language: CatGPT Usage Guide**

This document provides a quick overview of how to use your cat-themed programming language for basic calculations with Roman numeral-like inputs.

---

## **Introduction**
The language supports:
- **Cat-themed numbers**: Represented as strings like `meow`, `meow meow`, `huh`, etc.
- **Basic arithmetic operators**: Addition (`~`), Subtraction (`...`), Multiplication (`!`), Division (`?`).
- **Parentheses**: For grouping operations (`?!` and `!?`).

---

## **Cat-Themed Numbers**
Numbers are expressed using specific cat-like words:

| **Number** | **Cat Word**    | Example                      |
|------------|-----------------|------------------------------|
| 0          | `huh`           | `huh`                       |
| 1          | `meow`          | `meow`                      |
| 2          | `meow meow`     | `meow meow` or `meowmeow`    |
| 3          | `meow meow meow`| `meow meow meow` or `meowmeowmeow` |
| 5          | `myoo`          | `myoo`                      |
| 10         | `moewow`        | `moewow`                    |
| ...        | ...             | Numbers up to 99 are supported. |

---

## **Operators**

| **Operation**   | **Symbol** | **Example**                |
|------------------|------------|----------------------------|
| Addition         | `~`        | `meow ~ myoo` (1 + 5)     |
| Subtraction      | `...`      | `myoo ... meow` (5 - 1)   |
| Multiplication   | `!`        | `meow ! meow meow` (1 * 2)|
| Division         | `?`        | `myoo ? meow` (5 / 1)     |
| Parentheses      | `?!`(left) | `?! meow ~ myoo !? ! meow`|
|                  | `!?`(right)|              ((1 + 5) ! 1)|    


---

## **How to Use**
0. Compile files
    ```
    ocamlc -c tokens.ml
    ocamlc -c ast.ml
    ocamlc -c lexer.ml
    ocamlc -c parser.ml
    ocamlc -c interpreter.ml
    ocamlc -o main.byte tokens.cmo ast.cmo lexer.cmo parser.cmo interpreter.cmo main.ml
    ```

```
1. Start the program:
   in `utop`:

   ```ocaml
    #load "tokens.cmo";;
    #load "ast.cmo";;
    #load "lexer.cmo";;
    #load "parser.cmo";;
    #load "interpreter.cmo";;
    #load "main.cmo";;
   ```

2. Input a cat-themed calculation when prompted:
   ```
   How many treats do you want?:
   meow ~ meow meow
   ```

3. View the result:
   ```
   Result: 3
   ```

---

## **Examples**

### **Simple Addition**
Input:
```
meow ~ myoo
```
Output:
```
Result: 6
```

---

### **Mixed Operations**
Input:
```
meow ! myoo ... huh
```
Output:
```
Result: 5
```

---

### **Using Parentheses**
Input:
```
?! meow ~ myoo !? ! meow meow
```
Output:
```
Result: 12
```

---

### **Spaces in Input**
The program handles spaces flexibly:
- `meow meow` = `meowmeow` = 2.
- `meow ~ meow meow` = 3.

---

## **Known Limitations**
- Only supports integers from 0 to 99.
- Division by zero (`huh ? meow`) results in an error.

---

## **Troubleshooting**

1. **Unknown token error**:
   - Ensure your input only contains valid cat-themed words and operators.
   - Check for typos or unsupported characters.

2. **Unexpected results**:
   - Verify that you’ve entered numbers and operations correctly.

---

## ** Hurry up! Your cats are craving snacks from you 😺 🐾** 