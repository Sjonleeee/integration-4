import { graphQLRequest } from './utils/graphql'

export const getSubmissions = async () => {
  const { data } = await graphQLRequest(
    `query MyQuery {
  designsEntries {
    ... on designs_default_Entry {
      id
      title
      story
      designLinks
      designAuthor
    }
  }
}

    `,
  )
  console.log(data.designsEntries)
  return data.designsEntries
}

export const submitDesign = async (updates, designLinks) => {
  const { data } = await graphQLRequest(
    `
    mutation MyMutation ($title: String, $story: String, $designAuthor: String, $designLinks: String) {
  save_designs_default_Entry(
    authorId: "1"
    slug: "-"
    designAuthor: $designAuthor
    title: $title
    story: $story
    designLinks: $designLinks
  ) {
    id
    designAuthor
    title
    story
    designLinks
  }
}
`,
    { designLinks: designLinks, ...updates },
  )
  console.log(data)
  return data.save_designs_default_Entry
}

export const getProducts = async () => {
  const { data } = await graphQLRequest(
    `query getProducts {
  products {
    ... on shirts_Product {
      id
      title
      designAuthor
      story
      defaultPrice
      productImage {
        id
        ... on productImages_Asset {
          id
          url
        }
      }
    }
  }
}`,
  )
  console.log(data.products)
  return data.products
}
