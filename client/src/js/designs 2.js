import { graphQLRequest } from "./utils/graphql";

export const getSubmissions = async () => {
  const { data } = await graphQLRequest(
    `query MyQuery {
  designsEntries {
    ... on designs_default_Entry {
      id
      title
      story
    }
  }
}

    `
  );
  console.log(data.designsEntries);
  return data.designsEntries;
};
