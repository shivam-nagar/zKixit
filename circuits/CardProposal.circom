include "../node_modules/circomlib/circuits/poseidon.circom"

/* 
    Card proposal phase where active player proposes a card and description. 
    All other players propose their cards 
*/
template CardProposal {
    signal input cardAddress;
    signal input userAddress;
    signal input cardDescription;
    signal input isActive;
    signal input gameId;

    signal output out;

    component poseidonHasher = Poseidon(5);
    poseidonHasher.input[0] <== cardAddress;
    poseidonHasher.input[1] <== userAddress;
    poseidonHasher.input[2] <== cardDescription;
    poseidonHasher.input[3] <== isActive;
    poseidonHasher.input[4] <== gameId;

    out <== poseidonHasher.out;

}