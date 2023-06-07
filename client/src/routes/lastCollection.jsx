import { useLoaderData } from 'react-router-dom'
import { getProducts } from '../js/designs.js'

export async function loader() {
  console.log('This is the root loader')
  const result = await getProducts()
  return result
}

export default function LastCollection() {
  const lastCollection = useLoaderData()
  console.log(lastCollection)
  return (
    <div>
      <h1>SubmitPage</h1>
      {lastCollection.map(() => (
        <div key={lastCollection.id}>
          title={lastCollection.title}
          designAuthor={lastCollection.designAuthor}
          story={lastCollection.story}
          designLinks={lastCollection.productImage}
        </div>
      ))}
    </div>
  )
}
