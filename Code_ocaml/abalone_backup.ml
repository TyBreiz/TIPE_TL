(*Abalone Normale*)
(*Création de la structure de donnée*)
type statut = B | W | N;; (* Black, White, None *)
type case = S | O | P of statut;; (* Side, Outside, Playground *)

let board : case array array = [|
  [| O; O; O; O; O; S; S; S; S; S; S |];
  [| O; O; O; O; S; P (B); P (B); P (B); P (B); P (B); S |];
  [| O; O; O; S; P (B); P (B); P (B); P (B); P (B); P (B); S |];
  [| O; O; S; P (N); P (N); P (B); P (B); P (B); P (N); P (N); S |];
  [| O; S; P (N); P (N); P (N); P (N); P (N); P (N); P (N); P (N); S |];
  [| S; P (N); P (N); P (N); P (N); P (N); P (N); P (N); P (N); P (N); S |];
  [| S; P (N); P (N); P (N); P (N); P (N); P (N); P (N); P (N); S; O |];
  [| S; P (N); P (N); P (W); P (W); P (W); P (N); P (N); S; O; O |];
  [| S; P (W); P (W); P (W); P (W); P (W); P (W); S; O; O; O |];
  [| S; P (W); P (W); P (W); P (W); P (W); S; O; O; O; O |];
  [| S; S; S; S; S; S; O; O; O; O; O |];
|];;

(*Fonction d'évaluation de la partie*)

(*Trouver un équilibre entre temps de calcule de la fonction est profondeur de l'arbre*)

(*
Le score dépend de :
   Pour chaque bille :
   - La distance de chaque trou
   - Le nombre de bille proche allié (avec une pondération 1, 0.5, 0.25 etc)
   Le nombre de bille restante.
*)
let max x y =
  if x > y then x
  else y;;

let rec powerhalf n = match n with (*1/2 puissance n*)
  | 0 -> 1.
  | k -> 0.5 *. (powerhalf (n-1));;


let dist ((x1, y1) : int * int) ((x2, y2) : int * int) =
  if (x1-x2)*(y1-y2) < 0 then
    (abs (x1-x2)) + (abs (y1-y2)) + max (- abs (x1-x2)) (- abs (y1-y2))
  else if (x1-x2)*(y1-y2) > 0 then
    abs (x1-x2) + abs (y1-y2)
  else
    max (abs (x1-x2)) (abs (y1-y2));;

let case_score (grid : case array array) (xmax : int) (ymax : int) (x : int) (y : int) (t : statut)=
  let m_side = ref 0. in
  let m_team = ref 0. in
  if t = B then
    begin
      for i=0 to xmax do
        for j=0 to xmax do
          match grid.(i).(j) with
          | O -> ()
          | S -> m_side := !m_side +. (2. *. (powerhalf ( dist (x,y) (i,j))))
          | P (k) ->
              begin
                match k with
                | N -> ()
                | B -> m_team := !m_team +. (2. *. (powerhalf ( dist (x,y) (i,j))))
                | W -> m_team := !m_team -. (2. *. (powerhalf ( dist (x,y) (i,j))))
              end
        done;
      done;
      !m_team -. !m_side
    end
  else
 begin
      for i=0 to xmax do
        for j=0 to xmax do
          match grid.(i).(j) with
          | O -> ()
          | S -> m_side := !m_side +. (2. *. (powerhalf ( dist (x,y) (i,j))))
          | P (k) ->
              begin
                match k with
                | N -> ()
                | B -> m_team := !m_team -. (2. *. (powerhalf ( dist (x,y) (i,j))))
                | W -> m_team := !m_team +. (2. *. (powerhalf ( dist (x,y) (i,j))))
              end
        done;
      done;
      !m_team -. !m_side
    end

let score (grid : case array array) (xmax : int) (ymax : int) : float =
  let s_b = ref 0. in
  let s_w = ref 0. in
  let n_b = ref 0. in
  let n_w = ref 0. in
  for x=0 to xmax do
    for y=0 to ymax do
      match grid.(x).(y) with
      | S | O -> () (*cas ou ce n'est pas un pion*)
      | P (n) ->
        begin
          match n with
          | N -> ()
          | B -> begin
              s_b := !s_b +. (case_score grid xmax ymax x y B);
              n_b := !n_b +. 1.
            end
          | W -> begin
              s_w := !s_w +. (case_score grid xmax ymax x y W);
              n_w := !n_w +. 1.
            end
        end
    done;
  done;
  (!s_b /. !n_b) -. (!s_w /. !n_b);;

(*score board 10 10*)
