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

export const submitDesign = async (updates) => {
  const { data } = await graphQLRequest(
    `
    mutation MyMutation ($title: String, $story: String, $designAuthor: String) {
  save_designs_default_Entry(
    authorId: "1"
    slug: "-"
    designAuthor: $designAuthor
    title: $title
    story: $story
  ) {
    id
    designAuthor
    title
    story
  }
}
`,
    { ...updates }
  );
  console.log(data);
  return data.save_designs_default_Entry;
};
