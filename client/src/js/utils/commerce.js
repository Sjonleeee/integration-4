const BASE_URL = `https://integration4.ddev.site`;
console.log(BASE_URL);

export const getCart = async () => {
  const result = await fetch(`${BASE_URL}/actions/commerce/cart/get-cart`, {
    headers: {
      Accept: "application/json",
    },
  })
    .then((r) => r.json())
    .then((r) => console.log(r));
  if (!result.data) {
    console.log(result);
    throw new Error(result.errors[0].message);
  }
  return result;
};
