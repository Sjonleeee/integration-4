import { graphQLRequest } from './utils/graphql'

export const test = async () => {
  const { data } = await graphQLRequest()
  console.log(data)
}
