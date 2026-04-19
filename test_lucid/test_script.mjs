import { Lucid, Blockfrost } from 'lucid-cardano';
const lucid = await Lucid.new(undefined, "Preprod");
const script = { type: "PlutusV2", script: "49480100002221200101" };
console.log(lucid.utils.validatorToAddress(script));
