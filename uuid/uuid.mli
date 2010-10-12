(*
 * Copyright (C) 2006-2009 Citrix Systems Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; version 2.1 only. with the special
 * exception on linking described in file LICENSE.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *)
(** Type-safe UUIDs.
    Probably need to refactor this; UUIDs are used in two places:
    + to uniquely name things across the cluster
    + as secure session IDs

    There is the additional constraint that current Xen tools use 
    a particular format of UUID (the 16 byte variety generated by fresh ())

	Also, cookies aren't UUIDs and should be put somewhere else.
*)

(** A 128-bit UUID.  Using phantom types ('a) to achieve the requires type-safety. *)
type 'a t

(** Create a fresh UUID *)
val make_uuid : unit -> 'a t

(** Create a UUID from a string. *)
val of_string : string -> 'a t

(** Marshal a UUID to a string. *)
val to_string : 'a t -> string

(** A null UUID, as if such a thing actually existed.  It turns out to be
 * useful though. *)
val null : 'a t

(** Deprecated alias for {! Uuid.of_string} *)
val uuid_of_string : string -> 'a t

(** Deprecated alias for {! Uuid.to_string} *)
val string_of_uuid : 'a t -> string

(** Convert an array to a UUID. *)
val uuid_of_int_array : int array -> 'a t

(** Convert a UUID to an array. *)
val int_array_of_uuid : 'a t -> int array

(** Check whether a string is a UUID. *)
val is_uuid : string -> bool

(** A 512-bit cookie. *)
type cookie

val make_cookie : unit -> cookie

val cookie_of_string : string -> cookie

val string_of_cookie : cookie -> string
