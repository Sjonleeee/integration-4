import { graphQLRequest } from './utils/graphql'

export const getDesigns = async (id) => {
  const { data } = await graphQLRequest(
    `
    query getDesigns($id: ID!) {
      designsEntry(id: $id) {
        id
        title
        story
      }
    }
    `,
    { id: parseInt(id) }
  );
  console.log(data.designsEntry);
  return [data.designsEntry]; 
};

