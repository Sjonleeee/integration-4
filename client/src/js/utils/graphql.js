// const BASE_URL = "https://integration4.ddev.site";
const BASE_URL = import.meta.env.VITE_API_ENDPOINT || "";

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
    console.log(result.errors[0].message);
    throw new Error(result.errors[0].message);
  }
  return result;
};
