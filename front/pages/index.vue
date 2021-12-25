<template>
  <div class="container">
    <CBox
      d="flex"
      w="100vw"
      h="100vh"
      flex-dir="column"
      justify-content="center"
    >
      <CHeading text-align="center" mb="4">Hello Ruby on Rails & Nuxt.js</CHeading>
      <CFlex justify="center" direction="column" align="center">
        <CButton
          @click="getMsg"
        >
          Rails API から値を取得
        </CButton>
        <div
          v-for="(m, i) in msgs"
          :key="i"
        >
          {{ m }}
        </div>
      </CFlex>
    </CBox>
  </div>
</template>

<script lang="js">
import {
  CBox,
  CButton,
  CFlex,
  CHeading
} from '@chakra-ui/vue'

export default {
  name: 'IndexPage',
  components: {
    CBox,
    CButton,
    CFlex,
    CHeading
  },
  inject: ['$chakraColorMode', '$toggleColorMode'],
  data () {
    return {
      msgs: []
    }
  },
  computed: {
    colorMode () {
      return this.$chakraColorMode()
    }
  },
  methods: {
    getMsg () {
      this.$axios.$get('/api/v1/hello')
        .then(res => this.msgs.push(res))
    }
  }
}
</script>
