/* Ο παρακάτω κώδικας είναι ο αρχικός χωρίς καμία επεξεργασία και πάρθηκε από το παρακάτω link:http://sccode.org/1-5eN. Η επιλογή έγινε καθαρά λόγω γούστου.

*/

by Tim Walters

play{GVerb.ar(({|k|({|i|x=Impulse.kr(0.5**i/k);y=SinOsc;y.ar(i,y.ar(i+k**i)/Decay.kr(x,[i,i+1],k))}!6).sum}!16).sum,1)/512}//#supercollider


/* Παρακάτω παρουσιάζω τον παραπάνω κώδικα τροποποιημένο από εμένα.

*/

a = {GVerb.ar(({|k|({|i|x=Impulse.kr(1.5**i/k);y=SinOsc;y.ar(i,y.ar(i+k**i)/Decay.kr(x,[i,i+5],k))}!2).sum}!16).sum,6)/512}.play;


a.free;


/* Παρακάτω θα κάνω την σύνθεση με fade out 5 δευτερόλεπτα.

*/

(
{
	
	var synth;
	synth = a = {GVerb.ar(({|k|({|i|x=Impulse.kr(1.5**i/k);y=SinOsc;y.ar(i,y.ar(i+k**i)/Decay.kr(x,[i,i+5],k))}!2).sum}!16).sum,6)/512}.play;
	6.wait;
	synth release:5
	
}.fork;
)



/* Κατανόηση της ώθησης.

*/

(
{
	
	{ Impulse.ar(MouseX.kr(10, 30), 1, 0.8) }.scope;
	
	{ Impulse.ar(MouseX.kr(5, 10) * [1, 2], 0, 1) }.scope;
	
	{ Mix(Impulse.ar(MouseX.kr(5, 30) * (1..20), 1, 0.6)) }.scope; 
	
	{ Mix(Dust.ar(MouseX.kr(0.4, 5) / (1..40))) }.scope;
	
	
}
)




(
{
	var src, fx;
	src = Dust.kr(MouseX.kr(0.8, 8) / (10..2));
	fx = Decay.kr(src);
	Mix(fx) * WhiteNoise.ar(0.9);
	
	
}.scope;
)

{ Dust.ar(MouseX.kr(50, 100)) }.scope;


0.5 * [1, 2, 3, 4, 5];

0.5 + [1, 2, 3, 4, 5];

0.5 + (1..10);

(1..20) ** 0.5;

(1..20) ** (1/2);

(1..20) ** (1/3);

(1..20) ** 3.reciprocal;
(1..20) ** 2.reciprocal;

(1..20).squared;
(1..20).sqrt;







{ Impulse.ar(SinOsc.kr(0.5).range(0.8, 50), 1, 0.6) }.scope;

{ Impulse.ar(SinOsc.kr(0.5).range(MouseX.kr(5, 10), MouseY.kr(20, 50)), 1, 0.3) }.scope;




/* Επανάληψη του ~sound 2 φορές με 5 δευτερόλεπτα αναμονή πριν την έναρξη της 2ης φοράς.

*/


(
{
	~sound.value;
	5.wait;
	~sound.value;
}.fork;
)



/* Παρακάτω εμφανίζονται ο αριθμός των επαναλήψεων και ο χρόνος αναμονής.

*/


(
~piece = { | repeats = 5, delay = 5 |
	{
		repeats do: {
			~sound.value;
			delay.wait;
		}
		
	}.fork;
	
}
)



~sound.value;
	


