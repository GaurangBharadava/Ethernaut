This project or repo includes all the Ethernaut solution challenges solved by me using foundry framework.

**Note:** In this solution challenge i am not testing the contract but you will see the test file. it is require to commit into the git. Therefore donot take it seriously. If you want to test contract then you are free to do so.


1. Hello Ethurnaut Challenge:
-In this challenge i have written a script for deploying Level0 contract and authenticate the password of the instance which created in the challenge.

2. Fallback:
-In this challenge we have to change owner by contributing into the smart contract. for that i have written a script to srnd small eth to the contract to contribute, then i have directly sent the smallest eth to the contract, because of recieve function i have changed the owner.

3. Fallout:
-In this challenge we have to take ownership of the contract and drain  all the funds out of the contract. For that we have to call the constructor which seems like constructor but in actual it is not a constructor but it is a function. By calling the function we can take ownership of the contract. then drain all the funds of the contract.

4. CoinFlip:
-In this challenge we have to predict the coin side weather it is true or false. And have to count upto 10 times when coin side is true. For that i have develop a script and another contract which will do same computation logic to generate random number by which the coinside will able to predict.

5. Telephone:
-In this challenge i have to change owner of the contract with respect to tx.origin and msg.sender.