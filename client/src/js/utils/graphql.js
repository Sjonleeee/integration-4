// const BASE_URL = import.meta.env.VITE_API_ENDPOINT;
const BASE_URL = `https://integration4.ddev.site`;
console.log(BASE_URL);

export const graphQLRequest = async (query, variables = {}) => {
  const result = await fetch(`${BASE_URL}/api`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      query,
      variables,
    }),
  }).then((res) => res.json());
  if (!result.data) {
    console.log(result);
    throw new Error(result.errors[0].message);
  }
  return result;
};

export const getCart = async () => {
  const result = await fetch(`${BASE_URL}/actions/commerce/cart/get-cart`, {
    headers: {
      Accept: "application/json",
    },
  })
    .then((r) => r.json())
    .then(console.log);
  if (!result.data) {
    console.log(result);
    throw new Error(result.errors[0].message);
  }
  return result;
};
