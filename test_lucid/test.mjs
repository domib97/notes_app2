import { Lucid, Blockfrost, Koios, Maestro, Kupmios } from "lucid-cardano";

console.log("Exported modules:");
if (typeof Koios !== 'undefined') console.log("Koios is available");
if (typeof Blockfrost !== 'undefined') console.log("Blockfrost is available");

// Try instantiating Koios and getting parameters
(async () => {
    try {
        const koios = new Koios("https://preprod.koios.rest/api/v1");
        const params = await koios.getProtocolParameters();
        console.log("Koios Params:", params);
    } catch(e) {
        console.error("Koios error:", e);
    }
})();
