module.exports = {
    compilers: {
        solc: {
          version: '^0.5.17',
          settings: {
            optimizer: {
              enabled: true,
              runs: 5000000
            }
          }
        }
    },
    networks: {
        development: {
            host: "https://api.techpay.io",
            port: 80,
            network_id: "2569"
        },
        test: {
            host: "wsapi.testnet.techpay.io",
            port: 80,
            network_id: "4002"
        }
    }
};
