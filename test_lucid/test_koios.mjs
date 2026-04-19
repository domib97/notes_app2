import fetch from 'node-fetch';

(async () => {
    try {
        const res = await fetch("https://preprod.koios.rest/api/v1/epoch_params");
        const data = await res.json();
        const p = data[0];
        console.log(JSON.stringify(p.cost_models, null, 2));
    } catch(e) {
        console.error(e);
    }
})();