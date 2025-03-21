import { motion } from 'framer-motion';
import * as React from 'react';

export type BotProps = {
  size?: number;
  isAnimating?: boolean;
} & React.SVGProps<SVGElement>;

export const Bot: React.FC<BotProps> = ({ size = 24, isAnimating }) => (
  <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} fill="none" viewBox="0 0 364 364">
    <motion.g
      fill="currentColor"
      animate={isAnimating ? { rotate: [0, 4, 0, -4, 0] } : false}
      transition={{
        duration: 3,
        repeat: Infinity,
        ease: 'easeIn'
      }}
    >
      <path d="M203.094 130.344c-11.25 49.5-97.969 58.125-130.781 60.469l11.25-66.094 126.562-42.188 94.219 71.719c-1.406 12.187-9 38.813-50.625 25.313s-51.563-31.876-50.625-49.219"></path>
      <path
        fillRule="evenodd"
        d="m346.773 168.505-24.797-5.51 2.925 134.501 30.334-8.494A12 12 0 0 0 364 277.447v-87.466a22 22 0 0 0-17.227-21.476M39.131 297.496l2.924-134.501-24.796 5.51A22 22 0 0 0 .03 189.981v87.466a12 12 0 0 0 8.765 11.555zM289.016 41.614c-11.481.247-22.193 2.23-30.374 9.366-8.604 7.505-16.689 22.795-16.689 55.457v3h-20.062v-3c0-35.536 8.788-57.69 23.564-70.577 13.619-11.878 30.357-14.077 43.537-14.313C292.754 13.542 300.89 8 310.32 8c13.009 0 23.555 10.546 23.555 23.555s-10.546 23.554-23.555 23.554c-9.41 0-17.531-5.518-21.304-13.495M29.89 31.555C29.89 18.545 40.437 8 53.446 8c9.43 0 17.567 5.542 21.33 13.547 13.179.235 29.917 2.435 43.535 14.313 14.777 12.888 23.565 35.041 23.565 70.577v3h-20.063v-3c0-32.662-8.084-47.952-16.689-55.457-8.181-7.136-18.891-9.119-30.373-9.366-3.773 7.977-11.894 13.495-21.305 13.495-13.009 0-23.554-10.545-23.554-23.554"
        clipRule="evenodd"
      ></path>
      <path
        fillRule="evenodd"
        d="M27.313 221.083c0-95.939 69.262-173.708 154.688-173.708 85.432 0 154.687 77.769 154.687 173.708v70.04c0 87.503-309.375 87.503-309.375 0zm141.134-93.869c-56.11 0-101.595 46.743-101.595 104.404 0 36.038 28.428 65.253 63.497 65.253h103.302c35.069 0 63.498-29.215 63.498-65.253 0-57.661-45.486-104.404-101.596-104.404z"
        clipRule="evenodd"
      ></path>
      <motion.path
        className="eyes"
        animate={{ scaleY: [1, 1, 1, 0.5] }}
        transition={{
          duration: 3,
          times: [0, 0.8, 0.9, 1],
          repeat: Infinity
        }}
        d="M165 216.875c0-12.426-10.074-22.5-22.5-22.5s-22.5 10.074-22.5 22.5v13c0 12.426 10.074 22.5 22.5 22.5s22.5-10.074 22.5-22.5zM199 216.875c0-12.426 10.074-22.5 22.5-22.5s22.5 10.074 22.5 22.5v13c0 12.426-10.074 22.5-22.5 22.5s-22.5-10.074-22.5-22.5z"
      />
    </motion.g>
  </svg>
);
