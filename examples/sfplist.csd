<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac -+rtmidi=virtual -M0  ;;;realtime audio out, virtual midi in
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o sfplist.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

gisf	sfload	 "sf_GMbank.sf2"
	sfplist	 gisf					;list all presets
gir	sfpreset 125, 3, gisf, 0 			;preset = Car Pass

instr 1	; play from score and midi keyboard

	mididefault	60, p3
	midinoteonkey	p4, p5
inum	init	p4
ivel	init	p5
ivel	init	ivel/127				;make velocity dependent
kamp	linsegr	1, 1, 1, .1, 0
kamp	= kamp/6000					;scale amplitude
kfreq	init	1					;do not change freq from sf
a1,a2	sfplay3	ivel, inum, kamp, kfreq, gir
	outs	a1, a2
	
endin
	
</CsInstruments>
<CsScore>
f0  60				; stay active for 1 minute

i1 0 1 60 127
i1 + 1 62 <
i1 + 1 65 <
i1 + 1 69 10

e
</CsScore>
</CsoundSynthesizer>
