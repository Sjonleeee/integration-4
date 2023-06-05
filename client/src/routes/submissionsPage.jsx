import { useLoaderData } from 'react-router-dom'
import { getSubmissions } from '../js/designs.js'

export async function loader() {
  console.log('This is the root loader')
  const result = await getSubmissions()
  console.log(result)
  return result
}

export default function Submissions() {
  const submissions = useLoaderData()
  console.log(submissions)
  return (
    <div>
      <h1>SubmitPage</h1>
      {submissions.map((submission) => (
        <div key={submission.id}>
          <h2>{submission.title}</h2>
          <p>{submission.story}</p>
        </div>
      ))}
    </div>
  )
}
