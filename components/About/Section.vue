<template>
    <div>
        <div :style="{ 'font-size': (width > 1400) ? '18px' : '16px', 'text-align': 'justify', 'text-justify': 'inter-word' }" style="display: flex; flex-direction: column; gap: 24px;">
            <div>
                <span> {{ $t('about.one') }} </span>
            </div>
            <div>
                <span> {{ $t('about.two') }} </span>
            </div>
            <div style="padding: 12px 0px 12px 24px;">
                <div v-for="el, i in 5" :key="i">
                    <span> {{ $t(`about.three.${i}`) }} </span>
                </div>
            </div>
            <div>
                <span> {{ $t('about.four') }} </span>
            </div>
            <div>
                <span> {{ $t('about.five') }} </span>
            </div>
        </div>
    </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
import { useWindowSize } from '@vueuse/core';

export default defineComponent({
    setup() {
        const { width } = useWindowSize();
        return {
            width,
        };
    },
});
</script>