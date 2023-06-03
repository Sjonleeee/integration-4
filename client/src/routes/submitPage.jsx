import { useLoaderData } from 'react-router-dom'
import { getDesigns } from '../js/designs'

// // Loader
export const loader = async () => {
  console.log('This is the root loader')
  const result = await getDesigns()
  return result
}

export default function SubmitPage() {
  const data = useLoaderData()
  const design = data.map((design) => ({
    ...design,
  }))
  console.log(data)
  return (
    <div>
      <h1>SubmitPage</h1>
      <p> {design.title}</p>
      <p> {design.story}</p>
    </div>
  )
}
