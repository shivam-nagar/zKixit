
include "../node_modules/circomlib/circuits/poseidon.circom"

/* 
    After all cards are proposed, the game is open for voting. 
    Players vote for the likely card which was proposed by the active player. 
*/

template Voting {
    signal input cardAddress;
    signal input userAddress;
    signal input gameId;

    signal output out;

    component poseidonHasher = Poseidon(4);
    poseidonHasher.input[0] <== cardAddress;
    poseidonHasher.input[1] <== userAddress;
    poseidonHasher.input[2] <== gameId;

    out <== poseidonHasher.out;

}