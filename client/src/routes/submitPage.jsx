import { useLoaderData } from 'react-router-dom'
import { getDesigns } from '../js/designs'

export const loader = async () => {
  console.log('This is the root loader')
  const result = await getDesigns()
  return result
}

export default function SubmitPage() {
  const data = useLoaderData()
  console.log(data)

  if (!data || data.length === 0) {
    return <div>Loading...</div>
  }

  const design = data[0]

  return (
    <div>
      <h1>SubmitPage</h1>
      <p>Title: {design.title}</p>
      <p>Story: {design.story}</p>
    </div>
  )
}
