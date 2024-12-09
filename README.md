This project or repo includes all the Ethernaut solution challenges solved by me using foundry framework.

**Note:** In this solution challenge i am not testing the contract but you will see the test file. it is require to commit into the git. Therefore donot take it seriously. If you want to test contract then you are free to do so.


0. Hello Ethurnaut Challenge:
-In this challenge i have written a script for deploying Level0 contract and authenticate the password of the instance which created in the challenge.

1. Fallback:
-In this challenge we have to change owner by contributing into the smart contract. for that i have written a script to srnd small eth to the contract to contribute, then i have directly sent the smallest eth to the contract, because of recieve function i have changed the owner.

2. Fallout:
-In this challenge we have to take ownership of the contract and drain  all the funds out of the contract. For that we have to call the constructor which seems like constructor but in actual it is not a constructor but it is a function. By calling the function we can take ownership of the contract. then drain all the funds of the contract.

3. CoinFlip:
-In this challenge we have to predict the coin side weather it is true or false. And have to count upto 10 times when coin side is true. For that i have develop a script and another contract which will do same computation logic to generate random number by which the coinside will able to predict.

4. Telephone:
-In this challenge i have to change owner of the contract with respect to tx.origin and msg.sender.

5. Token:
-In this challenge 20 tokens are given to me, at the end i have to hack the contract and collect more then 20 tokens hands on. For that i took advanteg of intergerunderflow in erlier solidity version. and gained large amount of token in my hands.

6. Delegation:
-Tn this challenge i have to take over ownership of a contract by delegate call to another contract function that change the ownership of the contract. i have delegated the contract function and gained acces to the contract.

7. Force:
-In this challenge an empty contract is given to me. i have increase its balance greter then zero. For that i have used selfdestruct concept to colve this challenge.

8. Vault:
-In this challenge the vault contract has given in which the password has stored and locked. i have to unlock the vault in this challenge. For solve the challenge i read the storage slots of blockchain and retrive the password and unlocked the vault.