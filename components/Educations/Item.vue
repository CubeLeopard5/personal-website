<template>
<client-only>
    <a-row style="font-size: 18px; text-align: justify; text-justify: inter-word;">
        <a-col :span="6" v-if="width > 1400">
            <div style="display: flex; flex-direction: column; align-items: center; padding: 0px 24px 0px 0px; gap: 6px;">
                <img :src="img" alt="logo" style="width: 50%; height: 50%;"/>
                <span> {{ $t(`educations.items.${index}.compagny`) }} </span>
            </div>
        </a-col>
        <a-col :span="(width > 1400) ? 18 : 24">
            <div style="display: flex; flex-direction: row; justify-content: space-between; gap: 24px;">
                <span style="font-weight: bold; font-size: 20px;"> {{ $t(`educations.items.${index}.title`) }} </span>
                <span v-if="(width > 1400)"> {{ $t(`educations.items.${index}.time`) }} </span>
                <span v-else> {{ $t(`educations.items.${index}.time_abreged`) }} </span>
            </div>
            <div style="display: flex; flex-direction: column; gap: 8px; padding: 0px 24px 0px 0px; margin-top: 12px;">
                <span style="font-size: 16px; color: grey;"> {{ $t(`educations.items.${index}.place`) }} </span>
                <span> {{ $t(`educations.items.${index}.description`) }} </span>
            </div>
        </a-col>
    </a-row>
    </client-only>
</template>

<script>
import { useWindowSize } from '@vueuse/core';

export default defineComponent({
    props: {
        img: {
            type: String,
            required: true,
        },
        index: {
            type: Number,
            required: true,
        }
    },
    setup() {
        const { width } = useWindowSize();
        return {
            width,
        };
    },
});
</script>