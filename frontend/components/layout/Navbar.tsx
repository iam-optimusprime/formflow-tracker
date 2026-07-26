"use client";
import {  LogOut, User } from "lucide-react";
import ThemeToggle from "../ui/ThemeToggle";

export default function Navbar() {


  return (
    <div className="w-full flex items-center justify-between px-6 py-3 border-b bg-base-100">

      <h1 className="text-lg font-semibold">Dashboard</h1>

      <div className="flex items-center gap-4">

        <div className="flex items-center gap-2 text-sm">
          <User size={16} />
          Kunzy
        </div>

           <ThemeToggle />
        <button className="btn btn-sm btn-error flex items-center gap-1">
          <LogOut size={14} />
          Logout
        </button>

      </div>
    </div>
  );
}