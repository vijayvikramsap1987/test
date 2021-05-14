const cds = require("@sap/cds");
// const { addressValidation } = require("./Utils/AddressValidation");

const { Address } = cds.entities("shopApp.model.UserDetails");

// module.exports = cds.service.impl(srv => {

//     srv.before("CREATE", "CustomerDetails", addressValidation, async (req, res) => {
//         debugger;
//         console.log("Hello From Address");
//     })
// });
