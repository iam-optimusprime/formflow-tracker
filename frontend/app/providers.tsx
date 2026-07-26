"use client";

import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { useState, useEffect } from "react";
import { Toaster } from "react-hot-toast";
import { useThemeStore } from "../store/useThemeStore";

export default function Providers({ children }: { children: React.ReactNode }) {
  const [queryClient] = useState(() => new QueryClient());

  const theme = useThemeStore((state) => state.theme);

  // 🔥 Apply theme globally
  useEffect(() => {
    document.documentElement.setAttribute("data-theme", theme);
  }, [theme]);

  return (
    <QueryClientProvider client={queryClient}>
      
      {/* 🔔 Toast system */}
      <Toaster position="top-right" />

      {children}
    </QueryClientProvider>
  );
}