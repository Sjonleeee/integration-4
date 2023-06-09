import { graphQLRequest } from "./utils/graphql";

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
      likeAmount
    }
  }
}
    `
  );
  console.log(data.designsEntries);
  return data.designsEntries;
};

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
    { designLinks: designLinks, ...updates }
  );
  console.log(data);
  return data.save_designs_default_Entry;
};

export const addLike = async (id, likeAmount) => {
  const { data } = await graphQLRequest(
    `
       mutation MyMutation($likeAmount: Number) {
  save_designs_default_Entry(id: "${id}", likeAmount: $likeAmount) {
    ... on designs_default_Entry {
      likeAmount
    }
  }
}
    `,
    { likeAmount: likeAmount }
  );
  console.log(data);
  return data.likeDesign;
};

export const submitRequest = async (updates) => {
  const { data } = await graphQLRequest(
    `
    mutation MyMutation($title: String, $companyMail: String, $companyTelephone: String, $companyAdres: String, $companyPostcode: String, $companyCountry: String, $requestAmount: String, $requestDate: String, $requestDuration: String) {
  save_workshopRequests_default_Entry(
    authorId:"1"
    slug:"-"
    companyAdres: $companyAdres
    companyCountry: $companyCountry
    companyMail: $companyMail
    title: $title
    companyPostcode: $companyPostcode
    companyTelephone: $companyTelephone
    requestAmount: $requestAmount
    requestDate: $requestDate
    requestDuration: $requestDuration
  ) {
    id
    title
    companyAdres
    companyCountry
    companyMail
    companyPostcode
    companyTelephone
    requestAmount
    requestDate
    requestDuration
  }
}
`,
    { ...updates }
  );
  console.log(data);
  return data.save_workshopRequests_default_Entry;
};

export const getWorkshops = async () => {
  const { data } = await graphQLRequest(
    `query MyQuery {
  workshopsEntries {
    ... on workshops_default_Entry {
      id
      workshopAttendees
      workshopDate
      workshopInfo
      workshopPlace
      title
    }
  }
}

    `
  );
  console.log(data);
  return data.workshopsEntries;
};

export const joinWorkshop = async (id, workshopAttendees) => {
  const { data } = await graphQLRequest(
    `
       mutation MyMutation($workshopAttendees: Number) {
  save_workshops_default_Entry(id: "${id}", workshopAttendees: $workshopAttendees) {
    ... on workshops_default_Entry {
      workshopAttendees
    }
  }
}
    `,
    { workshopAttendees: workshopAttendees }
  );
  console.log(data);
  return data;
};
