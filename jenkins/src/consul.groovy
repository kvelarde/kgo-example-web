import groovy.json.JsonSlurperClassic
import groovy.json.JsonOutput

consul_endpoint='http://34.212.90.136:8500'


def getConsulValue(def key){
    return
}

def putConsulValue(def key, def value){
    def url = new URL("${consul_endpoint}/v1/kv/${key}")

    def http = url.openConnection()

    http.setDoOutput(true)
    http.setRequestMethod('PUT')
    http.setRequestProperty('User-Agent', 'groovy script')

    def out = new OutputStreamWriter(http.outputStream)

    out.write(${value})
    out.close()
    http.inputStream

    return
}

return this
