function [data, auxData, metaData, txtData, weights] = mydata_Crinia_georgiana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Myobatrachidae';
metaData.species    = 'Crinia_georgiana'; 
metaData.species_en = 'Quacking frog'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0jFp', 'jiTg', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj';  'Lp'; 'Li'; 'Wd0'; 'Wdh'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'E0'; 'Eh'; 'Ej'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-WdVe'; 't-WdYe'; 't-Wde'; 't-JO'}; 

metaData.COMPLETE = 3.3; % using criteria of LikaKear2011

metaData.author   = {'Casey Mueller'; 'Starrlight Augustine'; 'Bas Kooijman'};    
metaData.date_subm = [2012 03 20];              
metaData.email    = {'starrlight@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 14]; 


%% set data
% zero-variate data

data.ah = 19;        units.ah = 'd';   label.ah = 'age at hatch';             bibkey.ah = 'MuelAugu2012';   
  temp.ah = C2K(12); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 31;        units.ab = 'd';   label.ab = 'age at birth';             bibkey.ab = 'MuelAugu2012';   
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 14*30.5;   units.ap = 'd';   label.ap = 'age at puberty';           bibkey.ap = 'MuelAugu2012';
  temp.ap = C2K(12); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 1825;      units.am = 'd';   label.am = 'life span';                bibkey.am = 'MuelAugu2012';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.35;     units.Lh  = 'cm'; label.Lh  = 'total length at hatch';   bibkey.Lh  = 'MuelAugu2012';  
data.Lb  = 0.4;      units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'MuelAugu2012';  
data.Lj  = 0.6;      units.Lj  = 'cm'; label.Lj  = 'total length at metam';   bibkey.Lj  = 'MuelAugu2012';  
data.Lp  = 2.2;      units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'MuelAugu2012';  
data.Li  = 4.37;     units.Li  = 'cm'; label.Li  = 'ultimate total length';   bibkey.Li  = 'MuelAugu2012';

data.Wd0 = 2.74e-3;  units.Wd0 = 'g';  label.Wd0 = 'dry weight at hatch';     bibkey.Wd0 = 'MuelAugu2012';
data.Wdh = 2.66e-3;  units.Wdh = 'g';  label.Wdh = 'dry weight at hatch';     bibkey.Wdh = 'MuelAugu2012';
%data.WdVh = 0.68e-3; units.WdVh = 'g'; label.WdVh = 'dry weight of structure at hatch'; bibkey.WdVh = 'MuelAugu2012';
%data.WdEh = 1.98e-3; units.WdEh = 'g'; label.WdEh = 'dry weight of reserve at hatch';   bibkey.WdEh = 'MuelAugu2012';
data.Wdb = (1.56 + 1.34) * 1e-3;  units.Wdb = 'g'; label.Wdb = 'dry weight at birth';   bibkey.Wdb = 'MuelAugu2012';
%data.WdVb = 1.56e-3; units.WdVb = 'g'; label.WdVb = 'dry weight of structure at birth'; bibkey.WdVb = 'MuelAugu2012';
%data.WdEb = 1.34e-3; units.WdEb = 'g'; label.WdEb = 'dry weight of reserve at birth';   bibkey.WdEb = 'MuelAugu2012';
data.Wdj = (2.52 + 20.99) * 1e-3; units.Wdj = 'g'; label.Wdj = 'dry weight at metam';   bibkey.Wdj = 'MuelAugu2012';
data.Wdp = 0.20;     units.Wdp = 'g';  label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'MuelAugu2012';
data.Wdi = 1.2;      units.Wdi = 'g';  label.Wdi = 'ultimate wet weight';     bibkey.Wdi = 'MuelAugu2012';

data.E0 = 70.2654;   units.E0 = 'J';   label.E0 = 'energy in egg';            bibkey.E0 = 'MuelAugu2012';
data.Eh = 14.0974 + 51.4291; units.Eh = 'J';       label.Eh = 'energy at hatch';        bibkey.Eh = 'MuelAugu2012';
%data.EVh = 14.0974;  units.EVh = 'J';  label.EVh = 'energy of structure at hatch';      bibkey.EVh = 'MuelAugu2012';
%data.EEh = 51.4291;  units.EEh = 'J';  label.EEh = 'energy of reserve at hatch';        bibkey.EEh = 'MuelAugu2012';
data.Ej = 43.0153;   units.Ej = 'J';   label.Ej = 'energy at metam';          bibkey.Ej = 'MuelAugu2012';

data.Ri  = 200/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'MuelAugu2012';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

%  time-length data
data.tL = [20 40 100 185;  % d, age
        0.3 0.4 0.6 1.0]'; % cm, total length 
units.tL  = {'d', 'cm'}; label.tL = {'age', 'total length'};  
temp.tL   = C2K(12); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MuelAugu2012';

% time- dry mass data (we are excluding water from the analysis)
a2Wd = [ ... % age (day), yolk-free dry biomass (mg) 95% CI (mg)
0.00E+00	0.00E+00	0.00E+00
8.00E+00	5.44E-01	3.13E-01
9.00E+00	6.38E-01	2.94E-01
1.30E+01	3.95E-01	1.07E-01
1.80E+01	6.26E-01	1.50E-01
1.90E+01	6.82E-01	5.92E-02
2.30E+01	1.49E+00	5.95E-01
3.10E+01	1.56E+00	2.45E-01];
data.aWd = a2Wd(:,[1 2]); % age (day) , gut free dry mass (g)
units.aWd  = {'d', 'g'}; label.aWd = {'age', 'gut & yolk free dry mass'};  
temp.aWd   = C2K(12); units.temp.aWd = 'K'; label.temp.aWd = 'temperature';
bibkey.aWd = 'MuelAugu2012';
%
a2WdY = [ ... % age (day), yolk dry biomass (mg) 95% CI (mg)
0.00E+00	2.74E+00	1.14E-01
8.00E+00	2.28E+00	6.91E-01
9.00E+00	2.32E+00	6.35E-01
1.30E+01	1.28E+00	5.83E-01
1.80E+01	1.66E+00	4.46E-01
1.90E+01	1.98E+00	2.24E-01
2.30E+01	1.53E+00	2.07E-01
3.10E+01	1.34E+00	1.18E-01];
data.aWdY = a2WdY(:,[1 2]); % age (day), Yolk dry mass
units.aWdY  = {'d', 'g'}; label.aWdY = {'age', 'yolk dry mass'};  
temp.aWdY   = C2K(12); units.temp.aWdY = 'K'; label.temp.aWdY = 'temperature';
bibkey.aWdY = 'MuelAugu2012';
%
a2Wdtot = [ ... % age (d)	total dry mass (mg)	95% CI
0	2.7400	0.1136
8	2.8273	0.8679
9	2.1560	0.8964
13	1.6739	0.6405
18	2.1800	0.5201
19	2.6617	0.2024
23	3.0233	0.4063
31	2.8950	0.3626
36	2.7767	0.3173
43	2.1733	0.5203
47	1.8600	0.7361
51	2.2700	0.1337
66	2.1750	0.1321
80	3.5650	1.3426
108	2.6429	0.3474];
data.aWdtot = a2Wdtot(:,[1 2]); % age (day) , Gut free dry mass (g)
units.aWdtot  = {'d', 'g'}; label.aWdtot = {'age', 'total dry mass'};  
temp.aWdtot   = C2K(12); units.temp.aWdtot = 'K'; label.temp.aWdtot = 'temperature';
bibkey.aWdtot = 'MuelAugu2012';

% Respiration data: O2 consumption against development
% O2 consumption against age
aJO = [... % age (days)	MO2 (mumol/h)	MO2 mol/h 95% CI
3	0.00461	4.61364E-09	2.14325E-09;
4	0.00557	5.57285E-09	1.58888E-09;
5	0.00875	8.74965E-09	2.47948E-09;
8	0.01387	1.38669E-08	3.96652E-09;
11	0.02175	2.17508E-08	2.41261E-09;
13	0.02431	2.43148E-08	1.21729E-09;
14	0.03085	3.08458E-08	5.52426E-09;
15	0.03059	3.05879E-08	3.59745E-09;
16	0.03202	3.20220E-08	3.80940E-09;
18	0.03757	3.75744E-08	2.45958E-09;
19	0.03928	3.92810E-08	1.54745E-09;
20	0.03978	3.97807E-08	6.82806E-09;
21	0.04844	4.84390E-08	4.31760E-09;
22	0.07079	7.07856E-08	1.22093E-08;
23	0.07479	7.47885E-08	8.91059E-09;
24	0.07913	7.91314E-08	1.36561E-08;
25	0.09203	9.20256E-08	8.42509E-09;
26	0.10305	1.03046E-07	1.24319E-08;
29	0.11490	1.14898E-07	1.26115E-08;
31	0.11698	1.16979E-07	1.02774E-08;
33	0.14576	1.45755E-07	1.48894E-08;
36	0.16219	1.62189E-07	1.48451E-08;
38	0.16560	1.65605E-07	1.43398E-08;
40	0.16382	1.63820E-07	1.54542E-08;
43	0.14758	1.47575E-07	1.28989E-08;
45	0.17366	1.73656E-07	7.78092E-09;
47	0.15407	1.54066E-07	1.59291E-08;
51	0.17838	1.78385E-07	1.52764E-08;
54	0.18938	1.89379E-07	2.97897E-08;
60	0.18251	1.82513E-07	1.94078E-08;
66	0.16644	1.66442E-07	2.05968E-08;
73	0.18949	1.89489E-07	2.87717E-08;
80	0.22118	2.21184E-07	2.00838E-08;
88	0.17654	1.76541E-07	2.08262E-08;
91	0.24076	2.40764E-07	2.71585E-08;
100	0.22024	2.20238E-07	3.51742E-08;
108	0.23823	2.38226E-07	2.65471E-08];
data.aJO = aJO(:,[1 2]); % age (day), O2 consumption (mumol/h)
units.aJO  = {'d', 'mumol/h'}; label.aJO = {'age', 'O2 consumption'};  
temp.aJO   = C2K(12); units.temp.aJO = 'K'; label.temp.aJO = 'temperature';
bibkey.aJO = 'MuelAugu2012';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'This species decreases kappa between E_Hh and E_Hj, and resets after E_Hj';
D2 = 'Results of this entry are reported in MuelAug2012';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'no feeding for metamorphosis to froglet; cloud forests of Tasmania sea-level to 1100 m alpine heath';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'largest Australian anuran eggs, longest a_b';
metaData.bibkey.F2 = 'MuelAugu2012'; 
F3 = 'hatching at stage 25, birth at stage 37';
metaData.bibkey.F3 = 'Gosn1960'; 
F4 = 'Arrhenius applies for 5, 10 15 C till hatch, but not to 5 C cohort between hatch and birth';
metaData.bibkey.F4 = 'MuelAugu2012'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = 'ZGCS'; % Cat of Life
metaData.links.id_ITIS = '664663'; % ITIS
metaData.links.id_EoL = '330825'; % Ency of Life
metaData.links.id_Wiki = 'Crinia_georgiana'; % Wikipedia
metaData.links.id_ADW = 'Crinia_georgiana'; % ADW
metaData.links.id_Taxo = '79098'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Crinia+georgiana'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crinia_georgiana}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MitcSeym2000'; type = 'Article'; bib = [ ... 
'author = {Mitchell, N. J. and Seymour, R. S.}, ' ... 
'year = {2000}, ' ...
'title = {Effects of Temperature on Energy Cost and Timing of Embryonic and Larval Development of the Terrestrially Breeding Moss Frog, \emph{Bryobatrachus nimbus}}, ' ...
'journal = {Physiological and Biochemical Zoology}, ' ...
'volume = {73}, ' ...
'number = {6}, '...
'pages = {829--840}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gosn1960'; type = 'Article'; bib = [ ... 
'author = {Gosner K. L.}, ' ... 
'year = {1960}, ' ...
'title = {A simplified table for staging anuran embryos and larvae with notes on identification}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {16}, ' ...
'pages = {183-190}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MuelAugu2012'; type = 'Article'; bib = [ ... 
'author = {Mueller, C. and Augustine, S. and Kooijman, S. A. L. M. and Kearney, M. and Seymour, R.}, ' ... 
'year = {2012}, ' ...
'title = {The tradeoff between maturation and growth during accelerated development of frogs}, ' ...
'journal = {Comp. Physiol. Biochem. A}, ' ...
'howpublished = {\url{https://www.zotero.org/groups/500643/deb_library/items/4ZMA4WX3/item-details}}, '...
'volume = {163}, ' ...
'pages = {103--110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
