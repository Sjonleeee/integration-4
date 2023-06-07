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
      {lastCollection.map((item) => (
        <div key={item.id}>
          <p> title: {item.title}</p>
          <p> designAuthor: {item.designAuthor}</p>
          <p> story: {item.story}</p>
          <p> Price: {item.defaultPrice} euro</p>

          <img src={item.productImage[0].url} width={100} />
        </div>
      ))}
    </div>
  )
}
