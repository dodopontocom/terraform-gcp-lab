const request = require('request-promise')

var telegram_url = "https://api.telegram.org/"
//https://api.telegram.org/bot407633103:AAEtBhtw9En-Z_fcFil7bLbQHCXwxDwJAvA/sendMessage?chat_id=11504381&text=%22asd%22
process.env.TELEGRAM_TOKEN
process.env.TELEGRAM_CHAT_ID

const getTokenApp = ({MKP_URI, MKP_ENDPOINT_AUTH, MKP_BASIC_TOKEN}) => ({CampaignId}) => {
  const options = {
    uri: `${MKP_URI}${MKP_ENDPOINT_AUTH}`,
    method: 'POST',
    headers: {
      'Authorization': MKP_BASIC_TOKEN,
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    form: {
      campaign_id: CampaignId,
      grant_type: 'client_credentials'
    }
  }
  return request(options)
    .then(result => ({bearer: JSON.parse(result).access_token}))
}

const createParticipant = ({MKP_URI, MKP_ENDPOINT_PARTICIPANT}) => (Participant) => ({bearer}) => {
  const options = {
    uri: `${MKP_URI}${MKP_ENDPOINT_PARTICIPANT}`,
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${bearer}`,
      'content-type': 'application/json'
    },
    json: true,
    body: Participant
  }
  return request(options)
    .then(result => Participant)
}

const create = (config, Participant) =>
  getTokenApp(config)(Participant)
    .then(bearer => createParticipant(config)(Participant)(bearer))

module.exports = {create}