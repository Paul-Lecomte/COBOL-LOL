       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK-ACCOUNT.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 USER-CHOICE PIC 9.
       01 BALANCE PIC 9(5)V99 VALUE 1000.00.
       01 AMOUNT PIC 9(5)V99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM SHOW-MENU
           PERFORM PROCESS-CHOICE
           STOP RUN.

       SHOW-MENU.
           DISPLAY "===============================".
           DISPLAY " Welcome to COBOL Bank System ".
           DISPLAY "===============================".
           DISPLAY "1. Check Balance".
           DISPLAY "2. Deposit Money".
           DISPLAY "3. Withdraw Money".
           DISPLAY "4. Exit".
           DISPLAY "===============================".
           DISPLAY "Enter your choice (1-4): ".
           ACCEPT USER-CHOICE.

       PROCESS-CHOICE.
           EVALUATE USER-CHOICE
               WHEN 1
                   PERFORM CHECK-BALANCE
               WHEN 2
                   PERFORM DEPOSIT-MONEY
               WHEN 3
                   PERFORM WITHDRAW-MONEY
               WHEN 4
                   DISPLAY "Thank you for using COBOL Bank!"
               WHEN OTHER
                   DISPLAY "Invalid choice, please try again."
                   PERFORM SHOW-MENU
                   PERFORM PROCESS-CHOICE
           END-EVALUATE.

       CHECK-BALANCE.
           DISPLAY "Your current balance is: $" BALANCE.
           PERFORM SHOW-MENU
           PERFORM PROCESS-CHOICE.

       DEPOSIT-MONEY.
           DISPLAY "Enter deposit amount: ".
           ACCEPT AMOUNT.
           ADD AMOUNT TO BALANCE.
           DISPLAY "Deposit successful!".
           DISPLAY "New balance: $" BALANCE.
           PERFORM SHOW-MENU
           PERFORM PROCESS-CHOICE.

       WITHDRAW-MONEY.
           DISPLAY "Enter withdrawal amount: ".
           ACCEPT AMOUNT.
           IF AMOUNT > BALANCE THEN
               DISPLAY "Insufficient funds!"
           ELSE
               SUBTRACT AMOUNT FROM BALANCE
               DISPLAY "Withdrawal successful!"
               DISPLAY "New balance: $" BALANCE
           END-IF.
           PERFORM SHOW-MENU
           PERFORM PROCESS-CHOICE.