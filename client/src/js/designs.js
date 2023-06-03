import { graphQLRequest } from './utils/graphql'

export const getDesigns = async (id) => {
  const { data } = await graphQLRequest(
    `query getDesigns($id: QueryArgument) {
  designsEntries {
    ... on designs_default_Entry {
      id
      title
      story
    }
  }
}`,
    { id: parseInt(id) },
  )
  console.log(data.designsEntries)
  return data.designsEntries
}
